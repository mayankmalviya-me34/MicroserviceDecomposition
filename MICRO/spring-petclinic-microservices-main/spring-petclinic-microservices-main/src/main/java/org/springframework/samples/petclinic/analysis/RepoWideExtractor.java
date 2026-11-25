package org.springframework.samples.petclinic.analysis;

import com.github.javaparser.StaticJavaParser;
import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.ast.body.ClassOrInterfaceDeclaration;
import com.github.javaparser.ast.body.MethodDeclaration;
import com.github.javaparser.ast.expr.MethodCallExpr;
import com.github.javaparser.ast.expr.MethodReferenceExpr;
import com.github.javaparser.ParserConfiguration;

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
 * Multi-module PetClinic repository analyzer.
 */
public class RepoWideExtractor {

    // Set project root to repo root for multi-module scanning
    private static final String PROJECT_ROOT = ".";
    private static final String OUTPUT_DIR = "../../datasets/graphs/spring-petclinic/";

    // ---------- Static Graph ----------
    private static final Map<String, Set<String>> callGraph = new HashMap<>();
    private static final Map<String, List<String>> classMethods = new HashMap<>();

    // ---------- Function-level Semantic Data ----------
    private static final List<JSONObject> functionSemanticData = new ArrayList<>();

    public static void main(String[] args) throws Exception {

        ParserConfiguration config = new ParserConfiguration();
        config.setLanguageLevel(ParserConfiguration.LanguageLevel.JAVA_17);
        StaticJavaParser.setConfiguration(config);

        List<Path> javaFiles = new ArrayList<>();
        Files.walk(Paths.get(PROJECT_ROOT))
            .filter(p -> p.toString().endsWith(".java"))
            .forEach(javaFiles::add);

        System.out.println("Total Java files found: " + javaFiles.size());

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

            String pkg = cu.getPackageDeclaration().map(pd -> pd.getNameAsString()).orElse("");

            // Collect imports for semantic JSON
            List<String> imports = new ArrayList<>();
            cu.getImports().forEach(i -> imports.add(i.toString().trim()));

            cu.findAll(ClassOrInterfaceDeclaration.class).forEach(clazz -> {
                String className = pkg.isEmpty() ? clazz.getNameAsString() : pkg + "." + clazz.getNameAsString();

                List<String> methods = new ArrayList<>();

                clazz.findAll(MethodDeclaration.class).forEach(method -> {
                    String fullMethodName = className + "." + method.getNameAsString();
                    methods.add(fullMethodName);

                    // -------- Static Call Graph --------
                    method.findAll(MethodCallExpr.class).forEach(call -> {
                        String target = call.getScope().map(s -> s.toString() + "." + call.getNameAsString())
                            .orElse(className + "." + call.getNameAsString());
                        callGraph.computeIfAbsent(fullMethodName, k -> new HashSet<>()).add(target);
                    });

                    // Method references (Class::method)
                    method.findAll(MethodReferenceExpr.class).forEach(ref -> {
                        String target = ref.getScope().toString() + "." + ref.getIdentifier();
                        callGraph.computeIfAbsent(fullMethodName, k -> new HashSet<>()).add(target);
                    });

                    // -------- Semantic JSON (Function Level) --------
                    try {
                        JSONObject fn = new JSONObject();
                        fn.put("function", method.getNameAsString());
                        fn.put("class", className);

                        String params = method.getParameters().stream()
                            .map(p -> p.getNameAsString())
                            .reduce((a, b) -> a + ", " + b)
                            .orElse("");

                        fn.put("signature", method.getNameAsString() + "(" + params + ")");
                        fn.put("return_type", method.getType().asString());

                        Set<String> callsSet = new HashSet<>();
                        method.findAll(MethodCallExpr.class)
                            .forEach(c -> callsSet.add(
                                c.getScope()
                                    .map(s -> s.toString() + "." + c.getNameAsString())
                                    .orElse(c.getNameAsString())
                            ));

                        JSONArray calls = new JSONArray(callsSet);
                        method.findAll(MethodReferenceExpr.class).forEach(c -> calls.put(c.getIdentifier()));
                        fn.put("calls", calls);

                        JSONArray impArr = new JSONArray();
                        imports.forEach(impArr::put);
                        fn.put("imports", impArr);

                        fn.put("source_file", file.toString());

                        functionSemanticData.add(fn);
                    } catch (Exception e) {
                        System.err.println("Error processing method " + fullMethodName + ": " + e.getMessage());
                    }
                });

                classMethods.put(className, methods);
            });

        } catch (Exception e) {
            System.err.println("Error parsing " + file + " : " + e.getMessage());
        }
    }

    // ================= STATIC GRAPH =================
    private static void exportStaticGraphGML() throws Exception {
        FileWriter writer = new FileWriter(OUTPUT_DIR + "static.gml");
        writer.write("graph [\n  directed 1\n");

        Set<String> nodes = new HashSet<>();

        // Add classes
         nodes.addAll(classMethods.keySet());

       // Add methods
         classMethods.values().forEach(nodes::addAll);

       // Add all call targets (VERY IMPORTANT)
        callGraph.values().forEach(set -> nodes.addAll(set));

        Map<String, Integer> ids = new HashMap<>();
        int id = 0;

        for (String node : nodes) {

            String safeNode = node
                .replace("\"", "'")
                .replace("\n", " ")
                .replace("\r", " ")
                .replace("[", "(")
                .replace("]", ")")
                .trim();

            ids.put(node, id);

            writer.write("  node [ id " + id + " label \"" + safeNode + "\" ]\n");

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
        writer.flush();
        writer.close();
    }

    // ================= SEMANTIC JSON =================
    private static void exportSemanticJSON() throws Exception {
        JSONArray arr = new JSONArray();
        for (JSONObject obj : functionSemanticData) {
            arr.put(obj);
        }

        FileWriter writer = new FileWriter(OUTPUT_DIR + "semantic.json");
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

        Set<String> nodes = new HashSet<>();

        nodes.addAll(classMethods.keySet());
        classMethods.values().forEach(nodes::addAll);
        callGraph.values().forEach(nodes::addAll);

        for (String node : nodes) {
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
        transformer.transform(new DOMSource(doc),
            new StreamResult(new File(OUTPUT_DIR + "semantic.graphml")));
    }
}
