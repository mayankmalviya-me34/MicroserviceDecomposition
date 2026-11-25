package tools;

import com.github.javaparser.StaticJavaParser;
import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.body.ClassOrInterfaceDeclaration;
import com.github.javaparser.ast.body.MethodDeclaration;
import com.github.javaparser.ast.expr.MethodCallExpr;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import java.io.File;
import java.io.FileWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

/**
 * Extracts static and semantic graphs from the Spring PetClinic project.
 */
public class PetClinicGraphExtractor {

	private static final String PROJECT_ROOT = "src/main/java";

	private static final String OUTPUT_DIR = "datasets/graphs/spring-petclinic/";

	// ---------- Static Graph ----------
	private static final Map<String, Set<String>> callGraph = new HashMap<>();

	private static final Map<String, List<String>> classMethods = new HashMap<>();

	// ---------- Function-level Semantic Data ----------
	private static final List<JSONObject> functionSemanticData = new ArrayList<>();

	public static void main(String[] args) throws Exception {

		List<Path> javaFiles = new ArrayList<>();
		Files.walk(Paths.get(PROJECT_ROOT)).filter(p -> p.toString().endsWith(".java")).forEach(javaFiles::add);

		for (Path file : javaFiles) {
			parseFile(file);
		}

		new File(OUTPUT_DIR).mkdirs();

		exportStaticGraphGML();
		exportSemanticJSON();
		exportSemanticGraphML();

		System.out.println("Graphs generated in " + OUTPUT_DIR);
	}

	private static void parseFile(Path file) {

		try {
			CompilationUnit cu = StaticJavaParser.parse(file);

			// -------- Imports --------
			List<String> imports = new ArrayList<>();
			cu.getImports().forEach(i -> imports.add(i.toString().trim()));

			cu.findAll(ClassOrInterfaceDeclaration.class).forEach(clazz -> {

				String className = clazz.getFullyQualifiedName().orElse(clazz.getNameAsString());

				List<String> methods = new ArrayList<>();

				clazz.findAll(MethodDeclaration.class).forEach(method -> {

					String fullMethodName = className + "." + method.getNameAsString();
					methods.add(fullMethodName);

					// -------- Static Call Graph --------
					method.findAll(MethodCallExpr.class).forEach(call -> {
						call.getScope().ifPresent(scope -> {
							target = scope.toString() + "." + call.getNameAsString();
						});
						callGraph.computeIfAbsent(fullMethodName, k -> new HashSet<>()).add(target);
					});

					// -------- Semantic JSON (Function Level) --------
					JSONObject fn = new JSONObject();

					fn.put("function", method.getNameAsString());
					fn.put("class", clazz.getNameAsString());

					String params = method.getParameters()
						.stream()
						.map(p -> p.getNameAsString())
						.reduce((a, b) -> a + ", " + b)
						.orElse("");

					fn.put("signature", method.getNameAsString() + "(" + params + ")");
					fn.put("return_type", method.getType().asString());

					JSONArray calls = new JSONArray();
					method.findAll(MethodCallExpr.class).forEach(c -> calls.put(c.getNameAsString()));
					fn.put("calls", calls);

					JSONArray impArr = new JSONArray();
					imports.forEach(impArr::put);
					fn.put("imports", impArr);

					fn.put("source_file", file.getFileName().toString());

					functionSemanticData.add(fn);
				});

				classMethods.put(className, methods);
			});
		}
		catch (Exception e) {
			System.err.println("Error parsing " + file + " : " + e.getMessage());
		}
	}

	// ================= STATIC GRAPH =================

	private static void exportStaticGraphGML() throws Exception {

		FileWriter writer = new FileWriter(OUTPUT_DIR + "statics.gml");
		writer.write("graph [\n  directed 1\n");

		Set<String> nodes = new HashSet<>();
		nodes.addAll(classMethods.keySet());
		classMethods.values().forEach(nodes::addAll);

		Map<String, Integer> ids = new HashMap<>();
		int id = 0;

		for (String node : nodes) {
			ids.put(node, id);
			writer.write("  node [ id " + id + " label \"" + node + "\" ]\n");
			id++;
		}

		for (var entry : callGraph.entrySet()) {
			String src = entry.getKey();
			for (String tgt : entry.getValue()) {
				if (ids.containsKey(src) && ids.containsKey(tgt)) {
					writer.write("  edge [ source " + ids.get(src) + " target " + ids.get(tgt) + " ]\n");
				}
			}
		}

		writer.write("]\n");
		writer.close();
	}

	// ================= SEMANTIC JSON =================

	private static void exportSemanticJSON() throws Exception {

		JSONArray arr = new JSONArray();
		for (JSONObject obj : functionSemanticData) {
			arr.put(obj);
		}

		FileWriter writer = new FileWriter(OUTPUT_DIR + "semantics.json");
		writer.write(arr.toString(2));
		writer.close();
	}

	// ================= SEMANTIC GRAPHML =================

	private static void exportSemanticGraphML() throws Exception {

		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.newDocument();

		Element graphml = doc.createElement("graphml");
		graphml.setAttribute("xmlns", "http://graphml.graphdrawing.org/xmlns");
		doc.appendChild(graphml);

		Element graph = doc.createElement("graph");
		graph.setAttribute("id", "G");
		graph.setAttribute("edgedefault", "directed");
		graphml.appendChild(graph);

		Map<String, String> ids = new HashMap<>();
		int counter = 0;

		Set<String> allNodes = new HashSet<>();
		allNodes.addAll(classMethods.keySet());
		classMethods.values().forEach(allNodes::addAll);

		for (String node : allNodes) {
			Element n = doc.createElement("node");
			String nodeId = "n" + counter++;
			n.setAttribute("id", nodeId);

			Element data = doc.createElement("data");
			data.setTextContent(node);
			n.appendChild(data);

			graph.appendChild(n);
			ids.put(node, nodeId);
		}

		for (var entry : callGraph.entrySet()) {
			String src = entry.getKey();
			for (String tgt : entry.getValue()) {
				if (ids.containsKey(src) && ids.containsKey(tgt)) {
					Element e = doc.createElement("edge");
					e.setAttribute("source", ids.get(src));
					e.setAttribute("target", ids.get(tgt));
					graph.appendChild(e);
				}
			}
		}

		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		transformer.transform(new DOMSource(doc), new StreamResult(new File(OUTPUT_DIR + "semantics.graphml")));
	}

}
