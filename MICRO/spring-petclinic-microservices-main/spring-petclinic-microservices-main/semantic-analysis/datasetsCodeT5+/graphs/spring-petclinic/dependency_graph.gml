graph [
  directed 1
  node [
    id 0
    label "SpringBootAdminApplication"
    type "service_candidate"
    domain_entity "Spring Boot Admin"
    business_role "API Gateway"
    intent "API Gateway"
  ]
  node [
    id 1
    label "ApiGatewayApplication"
    type "service_candidate"
    domain_entity "API Gateway"
    business_role "API Gateway"
    intent "API Gateway"
  ]
  node [
    id 2
    label "CustomersServiceClient"
    type "service_candidate"
    domain_entity "Customer Service"
    business_role "API Gateway"
    intent "API Gateway"
  ]
  node [
    id 3
    label "VisitsServiceClient"
    type "service_candidate"
    domain_entity "Visit Service"
    business_role "API Gateway"
    intent "API Gateway"
  ]
  node [
    id 4
    label "ApiGatewayController"
    type "service_candidate"
    domain_entity "API Gateway"
    business_role "API Gateway"
    intent "API Gateway"
  ]
  node [
    id 5
    label "FallbackController"
    type "service_candidate"
    domain_entity "Fallback Controller"
    business_role "API Gateway"
    intent "API Gateway"
  ]
  node [
    id 6
    label "ConfigServerApplication"
    type "service_candidate"
    domain_entity "Config Server"
    business_role "API Gateway"
    intent "API Gateway"
  ]
  node [
    id 7
    label "CustomersServiceApplication"
    type "service_candidate"
    domain_entity "Customer Service"
    business_role "API Gateway"
    intent "API Gateway"
  ]
  node [
    id 8
    label "MetricConfig"
    type "service_candidate"
    domain_entity "Metrics Configuration"
    business_role "API Gateway"
    intent "API Gateway"
  ]
  node [
    id 9
    label "Pet"
    type "class"
    domain_entity "Pet"
    business_role "Pet"
    intent "Pet"
  ]
  node [
    id 10
    label "Owner"
    type "class"
    domain_entity "Owner"
    business_role "Owner"
    intent "Owner"
  ]
  node [
    id 11
    label "PetType"
    type "class"
    domain_entity "Pet Type"
    business_role "Pet Type"
    intent "Pet Type"
  ]
  edge [
    source 0
    target 1
    relation "depends_on"
  ]
  edge [
    source 1
    target 2
    relation "depends_on"
  ]
  edge [
    source 1
    target 3
    relation "depends_on"
  ]
  edge [
    source 1
    target 4
    relation "depends_on"
  ]
  edge [
    source 1
    target 5
    relation "depends_on"
  ]
  edge [
    source 1
    target 6
    relation "depends_on"
  ]
  edge [
    source 1
    target 7
    relation "depends_on"
  ]
  edge [
    source 1
    target 8
    relation "depends_on"
  ]
  edge [
    source 2
    target 9
    relation "uses"
  ]
  edge [
    source 2
    target 10
    relation "uses"
  ]
  edge [
    source 2
    target 11
    relation "uses"
  ]
  edge [
    source 3
    target 9
    relation "uses"
  ]
  edge [
    source 3
    target 10
    relation "uses"
  ]
  edge [
    source 3
    target 11
    relation "uses"
  ]
  edge [
    source 4
    target 9
    relation "uses"
  ]
  edge [
    source 4
    target 10
    relation "uses"
  ]
  edge [
    source 4
    target 11
    relation "uses"
  ]
  edge [
    source 5
    target 9
    relation "uses"
  ]
  edge [
    source 5
    target 10
    relation "uses"
  ]
  edge [
    source 5
    target 11
    relation "uses"
  ]
  edge [
    source 6
    target 9
    relation "uses"
  ]
  edge [
    source 6
    target 10
    relation "uses"
  ]
  edge [
    source 6
    target 11
    relation "uses"
  ]
  edge [
    source 7
    target 9
    relation "uses"
  ]
  edge [
    source 7
    target 10
    relation "uses"
  ]
  edge [
    source 7
    target 11
    relation "uses"
  ]
  edge [
    source 8
    target 9
    relation "uses"
  ]
  edge [
    source 8
    target 10
    relation "uses"
  ]
  edge [
    source 8
    target 11
    relation "uses"
  ]
]
