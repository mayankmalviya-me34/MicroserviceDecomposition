// Neo4j Cypher Import Script — PetClinic Semantic Graph
// Run via: neo4j-admin database import OR cypher-shell

// 1. Create constraints
CREATE CONSTRAINT IF NOT EXISTS FOR (n:Node) REQUIRE n.id IS UNIQUE;

// 2. Load nodes
LOAD CSV WITH HEADERS FROM 'file:///nodes.csv' AS row
MERGE (n:Node {id: row.id})
SET n.type = row.type, n.label = row.label,
    n.intent = row.intent, n.domain = row.domain,
    n.role = row.role, n.package = row.package;

// 3. Load relationships
LOAD CSV WITH HEADERS FROM 'file:///rels.csv' AS row
MATCH (a:Node {id: row.start})
MATCH (b:Node {id: row.end})
MERGE (a)-[:RELATES {type: row.type}]->(b);

// 4. Example queries
// Find all Controller classes:
// MATCH (n:Node) WHERE n.label CONTAINS 'Controller' RETURN n;

// Find all methods of a class:
// MATCH (c:Node {type:'class'})-[:RELATES]->(m:Node {type:'function'}) RETURN c.label, m.label;

// Find domain-grouped functions:
// MATCH (n:Node {type:'function'}) WHERE n.domain <> '' RETURN n.domain, collect(n.label);