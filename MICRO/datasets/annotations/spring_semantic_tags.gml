graph [
  directed 1
  node [
    id 0
    label "owner.setFirstName"
    function "setFirstName"
    intent "set"
    domain_entity "first"
    named_entities "first,name"
    business_role "Domain Logic"
  ]
  node [
    id 1
    label "PetDetails.PetDetailsBuilder.aPetDetails().id(20).name('Garfield').visits"
    function "visits"
    intent ""
    domain_entity "visit"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 2
    label "petclinicAiProvider.addPetToOwner"
    function "addPetToOwner"
    intent "add"
    domain_entity "pet"
    named_entities "owner,pet,to"
    business_role "Domain Logic"
  ]
  node [
    id 3
    label "org.springframework.samples.petclinic.genai.AIFunctionConfiguration.listOwners"
    function "listOwners"
    intent ""
    domain_entity "list"
    named_entities "list,owner"
    business_role "Configuration Layer"
  ]
  node [
    id 4
    label "method.getParameters().stream().map"
    function "map"
    intent ""
    domain_entity "map"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 5
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClient.joining"
    function "joining"
    intent "join"
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 6
    label "org.springframework.samples.petclinic.customers.web.PetResource.findPet"
    function "findPet"
    intent "find"
    domain_entity "pet"
    named_entities "pet"
    business_role "API Layer"
  ]
  node [
    id 7
    label "org.springframework.samples.petclinic.visits.web.VisitResource.create"
    function "create"
    intent "create"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 8
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor"
    function "RepoWideExtractor"
    intent ""
    domain_entity "repo"
    named_entities "extractor,repo,wide"
    business_role "Domain Logic"
  ]
  node [
    id 9
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor.exportSemanticJSON"
    function "exportSemanticJSON"
    intent "export"
    domain_entity "json"
    named_entities "json"
    business_role "Domain Logic"
  ]
  node [
    id 10
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication.loadBalancedWebClientBuilder"
    function "loadBalancedWebClientBuilder"
    intent "load"
    domain_entity "balanced"
    named_entities "balanced,builder,client,web"
    business_role "API Layer"
  ]
  node [
    id 11
    label "Visit.VisitBuilder.aVisit().id(2).petId"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Domain Logic"
  ]
  node [
    id 12
    label "c.getScope"
    function "getScope"
    intent "get"
    domain_entity "scope"
    named_entities "scope"
    business_role "Domain Logic"
  ]
  node [
    id 13
    label "e.getMessage"
    function "getMessage"
    intent "get"
    domain_entity "message"
    named_entities "message"
    business_role "Domain Logic"
  ]
  node [
    id 14
    label "webClient.post().uri(ownersHostname + 'owners/' + request.ownerId() + '/pets').bodyValue"
    function "bodyValue"
    intent ""
    domain_entity "body"
    named_entities "body,value"
    business_role "API Layer"
  ]
  node [
    id 15
    label "Collections.singletonList"
    function "singletonList"
    intent ""
    domain_entity "singleton"
    named_entities "list,singleton"
    business_role "Domain Logic"
  ]
  node [
    id 16
    label "this.getType"
    function "getType"
    intent "get"
    domain_entity "type"
    named_entities "type"
    business_role "Domain Logic"
  ]
  node [
    id 17
    label "graph.appendChild"
    function "appendChild"
    intent "append"
    domain_entity "child"
    named_entities "child"
    business_role "Domain Logic"
  ]
  node [
    id 18
    label "javaFiles.size"
    function "size"
    intent ""
    domain_entity "size"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 19
    label "org.springframework.samples.petclinic.genai.AIDataProvider.addPetToOwner"
    function "addPetToOwner"
    intent "add"
    domain_entity "pet"
    named_entities "owner,pet,to"
    business_role "Domain Logic"
  ]
  node [
    id 20
    label "org.springframework.samples.petclinic.visits.model.Visit.setPetId"
    function "setPetId"
    intent "set"
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Domain Model"
  ]
  node [
    id 21
    label "owner.setTelephone"
    function "setTelephone"
    intent "set"
    domain_entity "telephone"
    named_entities "telephone"
    business_role "Domain Logic"
  ]
  node [
    id 22
    label "org.springframework.samples.petclinic.visits.config.MetricConfig.metricsCommonTags"
    function "metricsCommonTags"
    intent ""
    domain_entity "metric"
    named_entities "common,metric,tags"
    business_role "Configuration Layer"
  ]
  node [
    id 23
    label "org.springframework.samples.petclinic.vets.model.Vet.getId"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "d,i"
    business_role "Domain Model"
  ]
  node [
    id 24
    label "graph.setAttribute"
    function "setAttribute"
    intent "set"
    domain_entity "attribute"
    named_entities "attribute"
    business_role "Domain Logic"
  ]
  node [
    id 25
    label "org.springframework.samples.petclinic.visits.model.Visit.getPetId"
    function "getPetId"
    intent "get"
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Domain Model"
  ]
  node [
    id 26
    label "org.springframework.samples.petclinic.customers.web.mapper.OwnerEntityMapper.map"
    function "map"
    intent ""
    domain_entity "map"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 27
    label "pet.setBirthDate"
    function "setBirthDate"
    intent "set"
    domain_entity "birth"
    named_entities "birth,date"
    business_role "Domain Logic"
  ]
  node [
    id 28
    label "org.springframework.samples.petclinic.admin.SpringBootAdminApplication"
    function "SpringBootAdminApplication"
    intent ""
    domain_entity "spring"
    named_entities "admin,application,boot,spring"
    business_role "Domain Logic"
  ]
  node [
    id 29
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClient.getVisitsForPets"
    function "getVisitsForPets"
    intent "get"
    domain_entity "visit"
    named_entities "pet,visit"
    business_role "Business Logic Layer"
  ]
  node [
    id 30
    label "owner.getPetIds"
    function "getPetIds"
    intent "get"
    domain_entity "pet"
    named_entities "ids,pet"
    business_role "Domain Logic"
  ]
  node [
    id 31
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.name"
    function "name"
    intent ""
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 32
    label "org.springframework.samples.petclinic.customers.model.Pet.equals"
    function "equals"
    intent "equal"
    domain_entity ""
    named_entities ""
    business_role "Domain Model"
  ]
  node [
    id 33
    label "pet.setType"
    function "setType"
    intent "set"
    domain_entity "type"
    named_entities "type"
    business_role "Domain Logic"
  ]
  node [
    id 34
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayControllerTest.getOwnerDetails_withAvailableVisitsService"
    function "getOwnerDetails_withAvailableVisitsService"
    intent "get"
    domain_entity "owner"
    named_entities "available,details,owner,service,visits"
    business_role "API Layer"
  ]
  node [
    id 35
    label "org.springframework.samples.petclinic.vets.VetsServiceApplication"
    function "VetsServiceApplication"
    intent ""
    domain_entity "vets"
    named_entities "application,service,vets"
    business_role "Business Logic Layer"
  ]
  node [
    id 36
    label "topMatches.stream().map"
    function "map"
    intent ""
    domain_entity "map"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 37
    label "visit.setId"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "d,i"
    business_role "Domain Logic"
  ]
  node [
    id 38
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayController.emptyVisitsForPets"
    function "emptyVisitsForPets"
    intent ""
    domain_entity "visit"
    named_entities "pet,visit"
    business_role "API Layer"
  ]
  node [
    id 39
    label "org.springframework.samples.petclinic.api.boundary.web.CircuitBreakerConfiguration.circuitBreakerRegistry"
    function "circuitBreakerRegistry"
    intent ""
    domain_entity "circuit"
    named_entities "breaker,circuit,registry"
    business_role "API Layer"
  ]
  node [
    id 40
    label "petRequest.id"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "d"
    business_role "Domain Logic"
  ]
  node [
    id 41
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest"
    function "VisitsServiceClientIntegrationTest"
    intent ""
    domain_entity "visit"
    named_entities "client,integration,service,test,visit"
    business_role "Business Logic Layer"
  ]
  node [
    id 42
    label "imports.forEach"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 43
    label "org.springframework.samples.petclinic.customers.web.ResourceNotFoundException"
    function "ResourceNotFoundException"
    intent "find"
    domain_entity "resource"
    named_entities "exception,resource"
    business_role "API Layer"
  ]
  node [
    id 44
    label "cat.id"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "d"
    business_role "Domain Logic"
  ]
  node [
    id 45
    label "Collections.unmodifiableList"
    function "unmodifiableList"
    intent ""
    domain_entity "list"
    named_entities "list"
    business_role "Domain Logic"
  ]
  node [
    id 46
    label "LOG.error"
    function "error"
    intent ""
    domain_entity "error"
    named_entities "error"
    business_role "Domain Logic"
  ]
  node [
    id 47
    label "org.springframework.samples.petclinic.customers.model.Owner.setCity"
    function "setCity"
    intent "set"
    domain_entity "city"
    named_entities "city"
    business_role "Domain Model"
  ]
  node [
    id 48
    label "log.info"
    function "info"
    intent ""
    domain_entity "info"
    named_entities "info"
    business_role "Domain Logic"
  ]
  node [
    id 49
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.given"
    function "given"
    intent "give"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 50
    label "org.springframework.samples.petclinic.genai.AIFunctionConfiguration.addOwnerToPetclinic"
    function "addOwnerToPetclinic"
    intent "add"
    domain_entity "owner"
    named_entities "owner"
    business_role "Configuration Layer"
  ]
  node [
    id 51
    label "ServerResponse.ok().contentType"
    function "contentType"
    intent ""
    domain_entity "content"
    named_entities "content,type"
    business_role "Domain Logic"
  ]
  node [
    id 52
    label "org.springframework.samples.petclinic.visits.model.Visit.date"
    function "date"
    intent ""
    domain_entity "date"
    named_entities "date"
    business_role "Domain Model"
  ]
  node [
    id 53
    label "callGraph.entrySet"
    function "entrySet"
    intent ""
    domain_entity "entry"
    named_entities "entry"
    business_role "Domain Logic"
  ]
  node [
    id 54
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.asList"
    function "asList"
    intent ""
    domain_entity "list"
    named_entities "list"
    business_role "API Layer"
  ]
  node [
    id 55
    label "ids.get"
    function "get"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 56
    label "factory.newDocumentBuilder"
    function "newDocumentBuilder"
    intent ""
    domain_entity "new"
    named_entities "builder,document,new"
    business_role "Domain Logic"
  ]
  node [
    id 57
    label "arr.toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 58
    label "client.get().uri"
    function "uri"
    intent ""
    domain_entity "uri"
    named_entities "uri"
    business_role "Business Logic Layer"
  ]
  node [
    id 59
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayController.addVisitsToOwner"
    function "addVisitsToOwner"
    intent "add"
    domain_entity "visit"
    named_entities "owner,visit"
    business_role "API Layer"
  ]
  node [
    id 60
    label "owner.setCity"
    function "setCity"
    intent "set"
    domain_entity "city"
    named_entities "city"
    business_role "Domain Logic"
  ]
  node [
    id 61
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody().jsonPath"
    function "jsonPath"
    intent ""
    domain_entity "json"
    named_entities "json,path"
    business_role "Business Logic Layer"
  ]
  node [
    id 62
    label "TransformerFactory.newInstance().newTransformer"
    function "newTransformer"
    intent ""
    domain_entity "new"
    named_entities "new,transformer"
    business_role "Domain Logic"
  ]
  node [
    id 63
    label "org.springframework.samples.petclinic.vets.model.Vet"
    function "Vet"
    intent ""
    domain_entity "vet"
    named_entities ""
    business_role "Domain Model"
  ]
  node [
    id 64
    label "mvc.perform(get('/vets').accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk()).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 65
    label "webClient.get().uri(vetsHostname + 'vets').retrieve().bodyToMono"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "body,mono"
    business_role "API Layer"
  ]
  node [
    id 66
    label "org.springframework.samples.petclinic.customers.model.Owner.getCity"
    function "getCity"
    intent "get"
    domain_entity "city"
    named_entities "city"
    business_role "Domain Model"
  ]
  node [
    id 67
    label "visits.items().get(0).petId"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Domain Logic"
  ]
  node [
    id 68
    label "pet.visits().addAll"
    function "addAll"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 69
    label "org.springframework.samples.petclinic.genai.VectorStoreController"
    function "VectorStoreController"
    intent ""
    domain_entity "vector"
    named_entities "controller,store,vector"
    business_role "API Layer"
  ]
  node [
    id 70
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.anOwnerDetails"
    function "anOwnerDetails"
    intent ""
    domain_entity "owner"
    named_entities "details,owner"
    business_role "Domain Logic"
  ]
  node [
    id 71
    label "PosixFilePermissions.fromString"
    function "fromString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 72
    label "functionSemanticData.add"
    function "add"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 73
    label "cu.getPackageDeclaration"
    function "getPackageDeclaration"
    intent "get"
    domain_entity "package"
    named_entities "declaration,package"
    business_role "Domain Logic"
  ]
  node [
    id 74
    label "new ToStringCreator(this).append('id', this.getId()).append('name', this.getName()).append"
    function "append"
    intent ""
    domain_entity "append"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 75
    label "OwnerDetails.OwnerDetailsBuilder.anOwnerDetails().pets"
    function "pets"
    intent ""
    domain_entity "pet"
    named_entities "pet"
    business_role "Domain Logic"
  ]
  node [
    id 76
    label "org.springframework.samples.petclinic.vets.system.CacheConfig"
    function "CacheConfig"
    intent ""
    domain_entity "cache"
    named_entities "cache,config"
    business_role "Configuration Layer"
  ]
  node [
    id 77
    label "webClientBuilder.build().get().uri(hostname + 'pets/visits?petId={petId}', joinIds(petIds)).retrieve().bodyToMono"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "body,mono"
    business_role "API Layer"
  ]
  node [
    id 78
    label "new Resilience4JConfigBuilder(id).circuitBreakerConfig(CircuitBreakerConfig.ofDefaults()).timeLimiterConfig(TimeLimiterConfig.custom().timeoutDuration(Duration.ofSeconds(10)).build()).build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Configuration Layer"
  ]
  node [
    id 79
    label "writer.write"
    function "write"
    intent "write"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 80
    label "petRequest.birthDate"
    function "birthDate"
    intent ""
    domain_entity "birth"
    named_entities "birth,date"
    business_role "Domain Logic"
  ]
  node [
    id 81
    label "owner.pets().forEach"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 82
    label "pet.setId"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "d,i"
    business_role "Domain Logic"
  ]
  node [
    id 83
    label "this.vectorStore.similaritySearch"
    function "similaritySearch"
    intent ""
    domain_entity "similarity"
    named_entities "search,similarity"
    business_role "Domain Logic"
  ]
  node [
    id 84
    label "c.getNameAsString"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "name,string"
    business_role "Domain Logic"
  ]
  node [
    id 85
    label "node.replace('\'', ''').replace('\n', ' ').replace('\r', ' ').replace"
    function "replace"
    intent "replace"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 86
    label "SearchRequest.from"
    function "from"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 87
    label "c.getScope().map(s -> s.toString() + '.' + c.getNameAsString()).orElse"
    function "orElse"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 88
    label "given(petRepository.findById(2)).willReturn"
    function "willReturn"
    intent "return"
    domain_entity ""
    named_entities ""
    business_role "Data Access Layer"
  ]
  node [
    id 89
    label "System.err.println"
    function "println"
    intent ""
    domain_entity "println"
    named_entities "println"
    business_role "Domain Logic"
  ]
  node [
    id 90
    label "n.appendChild"
    function "appendChild"
    intent "append"
    domain_entity "child"
    named_entities "child"
    business_role "Domain Logic"
  ]
  node [
    id 91
    label "webClient.get().uri(ownersHostname + 'owners').retrieve().bodyToMono(new ParameterizedTypeReference<List<OwnerDetails>>() {  }).block"
    function "block"
    intent ""
    domain_entity "block"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 92
    label "PetDetails.PetDetailsBuilder.aPetDetails().id(20).name"
    function "name"
    intent ""
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 93
    label "TimeLimiterConfig.custom"
    function "custom"
    intent ""
    domain_entity "custom"
    named_entities "custom"
    business_role "Configuration Layer"
  ]
  node [
    id 94
    label "StaticJavaParser.parse"
    function "parse"
    intent "parse"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 95
    label "org.springframework.samples.petclinic.customers.web.PetResource"
    function "PetResource"
    intent ""
    domain_entity "pet"
    named_entities "pet,resource"
    business_role "API Layer"
  ]
  node [
    id 96
    label "CircuitBreakerRegistry.ofDefaults"
    function "ofDefaults"
    intent ""
    domain_entity "default"
    named_entities "default"
    business_role "Domain Logic"
  ]
  node [
    id 97
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest"
    function "PetResourceTest"
    intent ""
    domain_entity "pet"
    named_entities "pet,resource,test"
    business_role "API Layer"
  ]
  node [
    id 98
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.get"
    function "get"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 99
    label "p.toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 100
    label "RouterFunctions.resources"
    function "resources"
    intent ""
    domain_entity "resource"
    named_entities "resource"
    business_role "API Layer"
  ]
  node [
    id 101
    label "pet.id"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "d"
    business_role "Domain Logic"
  ]
  node [
    id 102
    label "imports.add"
    function "add"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 103
    label "org.springframework.samples.petclinic.genai.VectorStoreController.convertListToJsonResource"
    function "convertListToJsonResource"
    intent "convert"
    domain_entity "list"
    named_entities "json,list,resource"
    business_role "API Layer"
  ]
  node [
    id 104
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 105
    label "org.springframework.samples.petclinic.discovery.DiscoveryServerApplication"
    function "DiscoveryServerApplication"
    intent ""
    domain_entity "discovery"
    named_entities "application,discovery,server"
    business_role "Domain Logic"
  ]
  node [
    id 106
    label "method.getType"
    function "getType"
    intent "get"
    domain_entity "type"
    named_entities "type"
    business_role "Domain Logic"
  ]
  node [
    id 107
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.aVisit"
    function "aVisit"
    intent ""
    domain_entity "visit"
    named_entities "visit"
    business_role "Domain Model"
  ]
  node [
    id 108
    label "n.setAttribute"
    function "setAttribute"
    intent "set"
    domain_entity "attribute"
    named_entities "attribute"
    business_role "Domain Logic"
  ]
  node [
    id 109
    label "request.ownerId"
    function "ownerId"
    intent ""
    domain_entity "owner"
    named_entities "d,i,owner"
    business_role "Domain Logic"
  ]
  node [
    id 110
    label "org.springframework.samples.petclinic.customers.config.MetricConfig.timedAspect"
    function "timedAspect"
    intent "time"
    domain_entity "aspect"
    named_entities "aspect"
    business_role "Configuration Layer"
  ]
  node [
    id 111
    label "visitsServiceClient.getVisitsForPets(owner.getPetIds()).transform"
    function "transform"
    intent "transform"
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 112
    label "org.springframework.samples.petclinic.vets.model.Specialty.setName"
    function "setName"
    intent "set"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Model"
  ]
  node [
    id 113
    label "webClient.post"
    function "post"
    intent "post"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 114
    label "new ToStringCreator(this).append('id', this.getId()).append('lastName', this.getLastName()).append('firstName', this.getFirstName()).append('address', this.address).append"
    function "append"
    intent ""
    domain_entity "append"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 115
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect(jsonPath('$.items(0).id').value(1)).andExpect(jsonPath('$.items(1).id').value(2)).andExpect(jsonPath('$.items(2).id').value(3)).andExpect(jsonPath('$.items(0).petId').value(111)).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 116
    label "visitsServiceClient.setHostname"
    function "setHostname"
    intent "set"
    domain_entity "hostname"
    named_entities "hostname"
    business_role "Business Logic Layer"
  ]
  node [
    id 117
    label "builder.newDocument"
    function "newDocument"
    intent ""
    domain_entity "new"
    named_entities "document,new"
    business_role "Domain Logic"
  ]
  node [
    id 118
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus"
    function "expectStatus"
    intent "expect"
    domain_entity "status"
    named_entities "status"
    business_role "Business Logic Layer"
  ]
  node [
    id 119
    label "visitsServiceClient.getVisitsForPets"
    function "getVisitsForPets"
    intent "get"
    domain_entity "visit"
    named_entities "pet,visit"
    business_role "Business Logic Layer"
  ]
  node [
    id 120
    label "this.chatClient.prompt().user(u -> u.text(query)).call"
    function "call"
    intent "call"
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 121
    label "webClientBuilder.build().get().uri('http://customers-service/owners/{ownerId}', ownerId).retrieve"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 122
    label "fn.put"
    function "put"
    intent "put"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 123
    label "org.springframework.samples.petclinic.visits.model.Visit.getId"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "d,i"
    business_role "Domain Model"
  ]
  node [
    id 124
    label "mvc.perform(get('/owners/2/pets/2').accept(MediaType.APPLICATION_JSON)).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 125
    label "org.springframework.samples.petclinic.genai.VectorStoreController.loadVetDataToVectorStoreOnStartup"
    function "loadVetDataToVectorStoreOnStartup"
    intent ""
    domain_entity "load"
    named_entities "data,load,startup,store,vector,vet"
    business_role "API Layer"
  ]
  node [
    id 126
    label "org.springframework.samples.petclinic.genai.AIDataProvider.addOwnerToPetclinic"
    function "addOwnerToPetclinic"
    intent "add"
    domain_entity "owner"
    named_entities "owner"
    business_role "Domain Logic"
  ]
  node [
    id 127
    label "ResponseEntity.status"
    function "status"
    intent ""
    domain_entity "status"
    named_entities "status"
    business_role "Domain Model"
  ]
  node [
    id 128
    label "mvc.perform(get('/vets').accept(MediaType.APPLICATION_JSON)).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 129
    label "Objects.equals"
    function "equals"
    intent "equal"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 130
    label "cu.findAll"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 131
    label "org.springframework.samples.petclinic.customers.CustomersServiceApplication"
    function "CustomersServiceApplication"
    intent ""
    domain_entity "customers"
    named_entities "application,customer,service"
    business_role "Business Logic Layer"
  ]
  node [
    id 132
    label "org.springframework.samples.petclinic.customers.config.MetricConfig"
    function "MetricConfig"
    intent ""
    domain_entity "metric"
    named_entities "config,metric"
    business_role "Configuration Layer"
  ]
  node [
    id 133
    label "org.springframework.samples.petclinic.customers.CustomersServiceApplication.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 134
    label "data.setTextContent"
    function "setTextContent"
    intent "set"
    domain_entity "text"
    named_entities "content,text"
    business_role "Domain Logic"
  ]
  node [
    id 135
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.assertEquals"
    function "assertEquals"
    intent "assert"
    domain_entity "equals"
    named_entities "equals"
    business_role "Business Logic Layer"
  ]
  node [
    id 136
    label "org.springframework.samples.petclinic.config.PetclinicConfigServerApplicationTests.contextLoads"
    function "contextLoads"
    intent ""
    domain_entity "context"
    named_entities "context,load"
    business_role "Configuration Layer"
  ]
  node [
    id 137
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor.parseFile"
    function "parseFile"
    intent ""
    domain_entity "parse"
    named_entities "parse"
    business_role "Domain Logic"
  ]
  node [
    id 138
    label "writer.flush"
    function "flush"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 139
    label "pet.setName"
    function "setName"
    intent "set"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 140
    label "org.springframework.samples.petclinic.customers.web.PetResource.save"
    function "save"
    intent "save"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 141
    label "nodes.addAll"
    function "addAll"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 142
    label "petRepository.findById(petId).orElseThrow"
    function "orElseThrow"
    intent ""
    domain_entity "else"
    named_entities "else"
    business_role "Data Access Layer"
  ]
  node [
    id 143
    label "org.springframework.samples.petclinic.customers.model.Owner.setFirstName"
    function "setFirstName"
    intent "set"
    domain_entity "first"
    named_entities "first,name"
    business_role "Domain Model"
  ]
  node [
    id 144
    label "org.springframework.samples.petclinic.vets.model.Specialty.getName"
    function "getName"
    intent "get"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Model"
  ]
  node [
    id 145
    label "classMethods.keySet"
    function "keySet"
    intent ""
    domain_entity "set"
    named_entities "set"
    business_role "Domain Logic"
  ]
  node [
    id 146
    label "Files.walk(Paths.get(PROJECT_ROOT)).filter"
    function "filter"
    intent "filter"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 147
    label "org.springframework.samples.petclinic.customers.model.Pet.getName"
    function "getName"
    intent "get"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Model"
  ]
  node [
    id 148
    label "get('/owners/2/pets/2').accept"
    function "accept"
    intent "accept"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 149
    label "this.server.shutdown"
    function "shutdown"
    intent ""
    domain_entity "shutdown"
    named_entities "shutdown"
    business_role "Domain Logic"
  ]
  node [
    id 150
    label "mvc.perform(get('/owners/2/pets/2').accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk()).andExpect(content().contentType('application/json')).andExpect(jsonPath('$.id').value(2)).andExpect(jsonPath('$.name').value('Basil')).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 151
    label "p.getNameAsString"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "name,string"
    business_role "Domain Logic"
  ]
  node [
    id 152
    label "org.springframework.samples.petclinic.admin.SpringBootAdminApplication.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 153
    label "jsonPath('$.items(1).petId').value"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 154
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.address"
    function "address"
    intent ""
    domain_entity "address"
    named_entities "address"
    business_role "Domain Logic"
  ]
  node [
    id 155
    label "webClientBuilder.build().get().uri"
    function "uri"
    intent ""
    domain_entity "uri"
    named_entities "uri"
    business_role "API Layer"
  ]
  node [
    id 156
    label "Visit.VisitBuilder.aVisit().id(1).petId"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Domain Logic"
  ]
  node [
    id 157
    label "Object.toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 158
    label "cbFactory.create"
    function "create"
    intent "create"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 159
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.jsonPath"
    function "jsonPath"
    intent ""
    domain_entity "json"
    named_entities "json,path"
    business_role "API Layer"
  ]
  node [
    id 160
    label "resource.exists"
    function "exists"
    intent "exist"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 161
    label "request.firstName"
    function "firstName"
    intent ""
    domain_entity "first"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 162
    label "org.springframework.samples.petclinic.customers.model.Owner.setAddress"
    function "setAddress"
    intent "set"
    domain_entity "address"
    named_entities "address"
    business_role "Domain Model"
  ]
  node [
    id 163
    label "org.springframework.samples.petclinic.genai.AIFunctionConfiguration.listVets"
    function "listVets"
    intent ""
    domain_entity "list"
    named_entities "vet"
    business_role "Configuration Layer"
  ]
  node [
    id 164
    label "petIds.stream().map(Object::toString).collect"
    function "collect"
    intent "collect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 165
    label "org.springframework.samples.petclinic.visits.model.Visit.id"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "d"
    business_role "Domain Model"
  ]
  node [
    id 166
    label "vet.setId"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "d,i"
    business_role "Domain Logic"
  ]
  node [
    id 167
    label "Optional.of"
    function "of"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 168
    label "webClient.get"
    function "get"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 169
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder"
    function "OwnerDetailsBuilder"
    intent ""
    domain_entity "owner"
    named_entities "builder,details,owner"
    business_role "Domain Logic"
  ]
  node [
    id 170
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.status"
    function "status"
    intent ""
    domain_entity "status"
    named_entities "status"
    business_role "API Layer"
  ]
  node [
    id 171
    label "c.getIdentifier"
    function "getIdentifier"
    intent "get"
    domain_entity "identifier"
    named_entities "identifier"
    business_role "Domain Logic"
  ]
  node [
    id 172
    label "StaticJavaParser.setConfiguration"
    function "setConfiguration"
    intent "set"
    domain_entity "configuration"
    named_entities "configuration"
    business_role "Configuration Layer"
  ]
  node [
    id 173
    label "org.springframework.samples.petclinic.customers.web.PetResource.processUpdateForm"
    function "processUpdateForm"
    intent ""
    domain_entity "process"
    named_entities "form,process,update"
    business_role "API Layer"
  ]
  node [
    id 174
    label "doc.createElement"
    function "createElement"
    intent "create"
    domain_entity "element"
    named_entities "element"
    business_role "Domain Logic"
  ]
  node [
    id 175
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor.exportSemanticGraphML"
    function "exportSemanticGraphML"
    intent "export"
    domain_entity "semantic"
    named_entities "graph,ml,semantic"
    business_role "Domain Logic"
  ]
  node [
    id 176
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.city"
    function "city"
    intent ""
    domain_entity "city"
    named_entities "city"
    business_role "Domain Logic"
  ]
  node [
    id 177
    label "webClient.post().uri(ownersHostname + 'owners').bodyValue"
    function "bodyValue"
    intent ""
    domain_entity "body"
    named_entities "body,value"
    business_role "API Layer"
  ]
  node [
    id 178
    label "method.getParameters"
    function "getParameters"
    intent "get"
    domain_entity "parameter"
    named_entities "parameter"
    business_role "Domain Logic"
  ]
  node [
    id 179
    label "mvc.perform(get('/owners/2/pets/2').accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk()).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 180
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect(jsonPath('$.items(0).id').value(1)).andExpect(jsonPath('$.items(1).id').value(2)).andExpect(jsonPath('$.items(2).id').value(3)).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 181
    label "org.springframework.samples.petclinic.api.boundary.web.CircuitBreakerConfiguration.resilience4JConfigurationProperties"
    function "resilience4JConfigurationProperties"
    intent ""
    domain_entity "resilience"
    named_entities "configuration,j,properties,resilience"
    business_role "API Layer"
  ]
  node [
    id 182
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.getVisitsForPets_withAvailableVisitsService"
    function "getVisitsForPets_withAvailableVisitsService"
    intent "get"
    domain_entity "visit"
    named_entities "available,pets,service,visit,visits"
    business_role "Business Logic Layer"
  ]
  node [
    id 183
    label "request.pet"
    function "pet"
    intent ""
    domain_entity "pet"
    named_entities "pet"
    business_role "Domain Logic"
  ]
  node [
    id 184
    label "customersServiceClient.getOwner"
    function "getOwner"
    intent "get"
    domain_entity "owner"
    named_entities "owner"
    business_role "Business Logic Layer"
  ]
  node [
    id 185
    label "registry.config"
    function "config"
    intent ""
    domain_entity "config"
    named_entities "config"
    business_role "Configuration Layer"
  ]
  node [
    id 186
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 187
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication.routerFunction"
    function "routerFunction"
    intent ""
    domain_entity "router"
    named_entities "function,router"
    business_role "Domain Logic"
  ]
  node [
    id 188
    label "callGraph.values"
    function "values"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 189
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.visits"
    function "visits"
    intent ""
    domain_entity "visit"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 190
    label "ResponseEntity.status(HttpStatus.SC_SERVICE_UNAVAILABLE).body"
    function "body"
    intent ""
    domain_entity "body"
    named_entities "body"
    business_role "Business Logic Layer"
  ]
  node [
    id 191
    label "petRepository.findPetTypeById"
    function "findPetTypeById"
    intent "find"
    domain_entity "pet"
    named_entities "d,i,pet,type"
    business_role "Data Access Layer"
  ]
  node [
    id 192
    label "ids.containsKey"
    function "containsKey"
    intent "contain"
    domain_entity "key"
    named_entities "key"
    business_role "Domain Logic"
  ]
  node [
    id 193
    label "cu.getImports().forEach"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 194
    label "org.springframework.samples.petclinic.visits.model.Visit.setDate"
    function "setDate"
    intent "set"
    domain_entity "date"
    named_entities "date"
    business_role "Domain Model"
  ]
  node [
    id 195
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.lastName"
    function "lastName"
    intent ""
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 196
    label "visit.setDate"
    function "setDate"
    intent "set"
    domain_entity "date"
    named_entities "date"
    business_role "Domain Logic"
  ]
  node [
    id 197
    label "org.springframework.samples.petclinic.customers.model.Pet.getId"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "d,i"
    business_role "Domain Model"
  ]
  node [
    id 198
    label "webClientBuilder.build().get().uri('http://customers-service/owners/{ownerId}', ownerId).retrieve().bodyToMono"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "body,mono"
    business_role "API Layer"
  ]
  node [
    id 199
    label "graphml.appendChild"
    function "appendChild"
    intent "append"
    domain_entity "child"
    named_entities "child"
    business_role "Domain Logic"
  ]
  node [
    id 200
    label "jsonPath('$.items(0).petId').value"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 201
    label "Mockito.when(customersServiceClient.getOwner(1)).thenReturn"
    function "thenReturn"
    intent "return"
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 202
    label "org.springframework.samples.petclinic.customers.model.Pet.getBirthDate"
    function "getBirthDate"
    intent "get"
    domain_entity "birth"
    named_entities "birth,date"
    business_role "Domain Model"
  ]
  node [
    id 203
    label "org.springframework.samples.petclinic.customers.model.PetType.setId"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "d,i"
    business_role "Domain Model"
  ]
  node [
    id 204
    label "u.text"
    function "text"
    intent ""
    domain_entity "text"
    named_entities "text"
    business_role "Domain Logic"
  ]
  node [
    id 205
    label "org.springframework.samples.petclinic.genai.AIDataProvider"
    function "AIDataProvider"
    intent ""
    domain_entity "ai"
    named_entities "ai,data,provider"
    business_role "Domain Logic"
  ]
  node [
    id 206
    label "org.springframework.samples.petclinic.genai.AIBeanConfiguration.loadBalancedWebClientBuilder"
    function "loadBalancedWebClientBuilder"
    intent "load"
    domain_entity "balanced"
    named_entities "balanced,builder,client,web"
    business_role "API Layer"
  ]
  node [
    id 207
    label "Visit.VisitBuilder.aVisit().id(2).petId(222).build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 208
    label "org.springframework.samples.petclinic.api.boundary.web.CircuitBreakerConfiguration"
    function "CircuitBreakerConfiguration"
    intent ""
    domain_entity "circuit"
    named_entities "breaker,circuit,configuration"
    business_role "API Layer"
  ]
  node [
    id 209
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.get"
    function "get"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 210
    label "org.springframework.samples.petclinic.config.ConfigServerApplication.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Configuration Layer"
  ]
  node [
    id 211
    label "file.toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 212
    label "server.url('/').toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 213
    label "org.springframework.samples.petclinic.vets.VetsServiceApplication.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 214
    label "content().contentType"
    function "contentType"
    intent ""
    domain_entity "content"
    named_entities "content,type"
    business_role "Domain Logic"
  ]
  node [
    id 215
    label "sr.withTopK"
    function "withTopK"
    intent ""
    domain_entity "k"
    named_entities "k"
    business_role "Domain Logic"
  ]
  node [
    id 216
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.date"
    function "date"
    intent ""
    domain_entity "date"
    named_entities "date"
    business_role "Domain Model"
  ]
  node [
    id 217
    label "org.springframework.samples.petclinic.visits.web.VisitResource.read"
    function "read"
    intent "read"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 218
    label "petIds.stream().map"
    function "map"
    intent ""
    domain_entity "map"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 219
    label "PetDetails.PetDetailsBuilder.aPetDetails().id(20).name('Garfield').visits(new ArrayList<>()).build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 220
    label "SearchRequest.from(SearchRequest.defaults()).withQuery"
    function "withQuery"
    intent ""
    domain_entity "query"
    named_entities "query"
    business_role "Domain Logic"
  ]
  node [
    id 221
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClient"
    function "VisitsServiceClient"
    intent ""
    domain_entity "visit"
    named_entities "client,service,visit"
    business_role "Business Logic Layer"
  ]
  node [
    id 222
    label "petRepository.findById"
    function "findById"
    intent "find"
    domain_entity "i"
    named_entities "d,i"
    business_role "Data Access Layer"
  ]
  node [
    id 223
    label "webClient.post().uri(ownersHostname + 'owners').bodyValue(ownerRequest).retrieve"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 224
    label "org.springframework.samples.petclinic.vets.model.Vet.getFirstName"
    function "getFirstName"
    intent "get"
    domain_entity "first"
    named_entities "first,name"
    business_role "Domain Model"
  ]
  node [
    id 225
    label "visits.items().stream"
    function "stream"
    intent ""
    domain_entity "stream"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 226
    label "Mockito.when"
    function "when"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 227
    label "webClient.post().uri(ownersHostname + 'owners').bodyValue(ownerRequest).retrieve().bodyToMono"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "body,mono"
    business_role "API Layer"
  ]
  node [
    id 228
    label "ref.getScope"
    function "getScope"
    intent "get"
    domain_entity "scope"
    named_entities "scope"
    business_role "Domain Logic"
  ]
  node [
    id 229
    label "method.getParameters().stream().map(p -> p.getNameAsString()).reduce((a, b) -> a + ', ' + b).orElse"
    function "orElse"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 230
    label "org.springframework.samples.petclinic.visits.VisitsServiceApplication"
    function "VisitsServiceApplication"
    intent ""
    domain_entity "visits"
    named_entities "application,service,visit"
    business_role "Business Logic Layer"
  ]
  node [
    id 231
    label "ids.put"
    function "put"
    intent "put"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 232
    label "org.springframework.samples.petclinic.visits.model.VisitRepository.findByPetIdIn"
    function "findByPetIdIn"
    intent "find"
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Data Access Layer"
  ]
  node [
    id 233
    label "method.findAll(MethodReferenceExpr.class).forEach"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 234
    label "org.springframework.samples.petclinic.customers.model.Owner.getPets"
    function "getPets"
    intent "get"
    domain_entity "pet"
    named_entities "pet"
    business_role "Domain Model"
  ]
  node [
    id 235
    label "method.findAll"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 236
    label "org.springframework.samples.petclinic.customers.model.Owner"
    function "Owner"
    intent ""
    domain_entity "owner"
    named_entities "owner"
    business_role "Domain Model"
  ]
  node [
    id 237
    label "org.springframework.samples.petclinic.customers.model.Owner.toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Model"
  ]
  node [
    id 238
    label "writer.close"
    function "close"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 239
    label "org.springframework.samples.petclinic.customers.model.Owner.getFirstName"
    function "getFirstName"
    intent "get"
    domain_entity "first"
    named_entities "first,name"
    business_role "Domain Model"
  ]
  node [
    id 240
    label "impArr.put"
    function "put"
    intent "put"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 241
    label "org.springframework.samples.petclinic.visits.model.Visit.build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Domain Model"
  ]
  node [
    id 242
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.assertVisitDescriptionEquals"
    function "assertVisitDescriptionEquals"
    intent "assert"
    domain_entity "visit"
    named_entities "description,visit"
    business_role "Business Logic Layer"
  ]
  node [
    id 243
    label "org.springframework.samples.petclinic.customers.model.PetRepository.findPetTypes"
    function "findPetTypes"
    intent "find"
    domain_entity "pet"
    named_entities "pet,types"
    business_role "Data Access Layer"
  ]
  node [
    id 244
    label "visitRepository.findByPetIdIn"
    function "findByPetIdIn"
    intent "find"
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Data Access Layer"
  ]
  node [
    id 245
    label "TimeLimiterConfig.custom().timeoutDuration(Duration.ofSeconds(10)).build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Configuration Layer"
  ]
  node [
    id 246
    label "logger.info"
    function "info"
    intent ""
    domain_entity "info"
    named_entities "info"
    business_role "Domain Logic"
  ]
  node [
    id 247
    label "webClient.post().uri(ownersHostname + 'owners/' + request.ownerId() + '/pets').bodyValue(request.pet()).retrieve().bodyToMono(PetDetails.class).block"
    function "block"
    intent ""
    domain_entity "block"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 248
    label "ref.getIdentifier"
    function "getIdentifier"
    intent "get"
    domain_entity "identifier"
    named_entities "identifier"
    business_role "Domain Logic"
  ]
  node [
    id 249
    label "Mono.error"
    function "error"
    intent ""
    domain_entity "error"
    named_entities "error"
    business_role "Domain Logic"
  ]
  node [
    id 250
    label "method.getParameters().stream().map(p -> p.getNameAsString()).reduce"
    function "reduce"
    intent "reduce"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 251
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.prepareResponse"
    function "prepareResponse"
    intent "prepare"
    domain_entity "response"
    named_entities "response"
    business_role "Business Logic Layer"
  ]
  node [
    id 252
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.id"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "d"
    business_role "Domain Model"
  ]
  node [
    id 253
    label "method.getParameters().stream"
    function "stream"
    intent ""
    domain_entity "stream"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 254
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder"
    function "VisitBuilder"
    intent "visit"
    domain_entity "builder"
    named_entities "builder"
    business_role "Domain Model"
  ]
  node [
    id 255
    label "this.getOwner().getFirstName"
    function "getFirstName"
    intent "get"
    domain_entity "first"
    named_entities "first,name"
    business_role "Domain Logic"
  ]
  node [
    id 256
    label "org.springframework.samples.petclinic.vets.model.Specialty.getId"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "d,i"
    business_role "Domain Model"
  ]
  node [
    id 257
    label "petRequest.typeId"
    function "typeId"
    intent ""
    domain_entity "type"
    named_entities "d,i,type"
    business_role "Domain Logic"
  ]
  node [
    id 258
    label "org.springframework.samples.petclinic.visits.model.Visit.setId"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "d,i"
    business_role "Domain Model"
  ]
  node [
    id 259
    label "callGraph.computeIfAbsent"
    function "computeIfAbsent"
    intent ""
    domain_entity "absent"
    named_entities "absent"
    business_role "Domain Logic"
  ]
  node [
    id 260
    label "graphml.setAttribute"
    function "setAttribute"
    intent "set"
    domain_entity "attribute"
    named_entities "attribute"
    business_role "Domain Logic"
  ]
  node [
    id 261
    label "petRepository.save"
    function "save"
    intent "save"
    domain_entity ""
    named_entities ""
    business_role "Data Access Layer"
  ]
  node [
    id 262
    label "pet.visits"
    function "visits"
    intent ""
    domain_entity "visit"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 263
    label "calls.put"
    function "put"
    intent "put"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 264
    label "v.petId"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Domain Logic"
  ]
  node [
    id 265
    label "methods.add"
    function "add"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 266
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayController.getOwnerDetails"
    function "getOwnerDetails"
    intent "get"
    domain_entity "owner"
    named_entities "details,owner"
    business_role "API Layer"
  ]
  node [
    id 267
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.shutdown"
    function "shutdown"
    intent ""
    domain_entity "shutdown"
    named_entities "shutdown"
    business_role "Business Logic Layer"
  ]
  node [
    id 268
    label "org.springframework.samples.petclinic.customers.model.Pet.getOwner"
    function "getOwner"
    intent "get"
    domain_entity "owner"
    named_entities "owner"
    business_role "Domain Model"
  ]
  node [
    id 269
    label "this.getOwner"
    function "getOwner"
    intent "get"
    domain_entity "owner"
    named_entities "owner"
    business_role "Domain Logic"
  ]
  node [
    id 270
    label "petIds.stream"
    function "stream"
    intent ""
    domain_entity "stream"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 271
    label "cu.getPackageDeclaration().map(pd -> pd.getNameAsString()).orElse"
    function "orElse"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 272
    label "owner.addPet"
    function "addPet"
    intent "add"
    domain_entity "pet"
    named_entities "pet"
    business_role "Domain Logic"
  ]
  node [
    id 273
    label "petRequest.name"
    function "name"
    intent ""
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 274
    label "new ToStringCreator(this).append"
    function "append"
    intent ""
    domain_entity "append"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 275
    label "Objects.hash"
    function "hash"
    intent ""
    domain_entity "hash"
    named_entities "hash"
    business_role "Domain Logic"
  ]
  node [
    id 276
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect(jsonPath('$.items(0).id').value(1)).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 277
    label "call.getScope"
    function "getScope"
    intent "get"
    domain_entity "scope"
    named_entities "scope"
    business_role "Domain Logic"
  ]
  node [
    id 278
    label "org.springframework.samples.petclinic.api.boundary.web.FallbackController.fallback"
    function "fallback"
    intent ""
    domain_entity "fallback"
    named_entities "fallback"
    business_role "API Layer"
  ]
  node [
    id 279
    label "SpringApplication.run"
    function "run"
    intent "run"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 280
    label "visits.items().stream().filter(v -> v.petId() == pet.id()).toList"
    function "toList"
    intent ""
    domain_entity "list"
    named_entities "list"
    business_role "Domain Logic"
  ]
  node [
    id 281
    label "classMethods.put"
    function "put"
    intent "put"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 282
    label "Files.walk(Paths.get(PROJECT_ROOT)).filter(p -> p.toString().endsWith('.java')).forEach"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 283
    label "logger.error"
    function "error"
    intent ""
    domain_entity "error"
    named_entities "error"
    business_role "Domain Logic"
  ]
  node [
    id 284
    label "OwnerDetails.OwnerDetailsBuilder.anOwnerDetails"
    function "anOwnerDetails"
    intent ""
    domain_entity "owner"
    named_entities "details,owner"
    business_role "Domain Logic"
  ]
  node [
    id 285
    label "org.springframework.samples.petclinic.customers.web.PetResource.processCreationForm"
    function "processCreationForm"
    intent ""
    domain_entity "process"
    named_entities "creation,form,process"
    business_role "API Layer"
  ]
  node [
    id 286
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication.defaultCustomizer"
    function "defaultCustomizer"
    intent ""
    domain_entity "default"
    named_entities "customizer,default"
    business_role "Domain Logic"
  ]
  node [
    id 287
    label "p.toString().endsWith"
    function "endsWith"
    intent "end"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 288
    label "o.getClass"
    function "getClass"
    intent "get"
    domain_entity "class"
    named_entities "class"
    business_role "Domain Logic"
  ]
  node [
    id 289
    label "org.springframework.samples.petclinic.customers.model.PetType.getId"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "d,i"
    business_role "Domain Model"
  ]
  node [
    id 290
    label "given(vetRepository.findAll()).willReturn"
    function "willReturn"
    intent "return"
    domain_entity ""
    named_entities ""
    business_role "Data Access Layer"
  ]
  node [
    id 291
    label "ownerRepository.save"
    function "save"
    intent "save"
    domain_entity ""
    named_entities ""
    business_role "Data Access Layer"
  ]
  node [
    id 292
    label "owner.setAddress"
    function "setAddress"
    intent "set"
    domain_entity "address"
    named_entities "address"
    business_role "Domain Logic"
  ]
  node [
    id 293
    label "org.springframework.samples.petclinic.config.ConfigServerApplication"
    function "ConfigServerApplication"
    intent ""
    domain_entity "config"
    named_entities "application,config,server"
    business_role "Configuration Layer"
  ]
  node [
    id 294
    label "ownerRepository.findById"
    function "findById"
    intent "find"
    domain_entity "i"
    named_entities "d,i"
    business_role "Data Access Layer"
  ]
  node [
    id 295
    label "Visit.VisitBuilder.aVisit().id(1).petId(111).build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 296
    label "petclinicAiDataProvider.addOwnerToPetclinic"
    function "addOwnerToPetclinic"
    intent "add"
    domain_entity "owner"
    named_entities "owner"
    business_role "Domain Logic"
  ]
  node [
    id 297
    label "org.springframework.samples.petclinic.customers.model.OwnerRepository"
    function "OwnerRepository"
    intent ""
    domain_entity "owner"
    named_entities "owner,repository"
    business_role "Data Access Layer"
  ]
  node [
    id 298
    label "ownerRepository.findAll"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities ""
    business_role "Data Access Layer"
  ]
  node [
    id 299
    label "cb.run"
    function "run"
    intent "run"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 300
    label "new ToStringCreator(this).append('id', this.getId()).append('lastName', this.getLastName()).append"
    function "append"
    intent ""
    domain_entity "append"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 301
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.jsonPath"
    function "jsonPath"
    intent ""
    domain_entity "json"
    named_entities "json,path"
    business_role "API Layer"
  ]
  node [
    id 302
    label "org.springframework.samples.petclinic.visits.model.VisitRepository.findByPetId"
    function "findByPetId"
    intent "find"
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Data Access Layer"
  ]
  node [
    id 303
    label "System.out.println"
    function "println"
    intent ""
    domain_entity "println"
    named_entities "println"
    business_role "Domain Logic"
  ]
  node [
    id 304
    label "status().isOk"
    function "isOk"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 305
    label "webClient.post().uri"
    function "uri"
    intent ""
    domain_entity "uri"
    named_entities "uri"
    business_role "API Layer"
  ]
  node [
    id 306
    label "org.springframework.samples.petclinic.discovery.DiscoveryServerApplicationTests.contextLoads"
    function "contextLoads"
    intent ""
    domain_entity "context"
    named_entities "context,load"
    business_role "Domain Logic"
  ]
  node [
    id 307
    label "org.springframework.samples.petclinic.customers.config.MetricConfig.metricsCommonTags"
    function "metricsCommonTags"
    intent ""
    domain_entity "metric"
    named_entities "common,metric,tags"
    business_role "Configuration Layer"
  ]
  node [
    id 308
    label "arr.put"
    function "put"
    intent "put"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 309
    label "new ToStringCreator(this).append('id', this.getId()).append"
    function "append"
    intent ""
    domain_entity "append"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 310
    label "jsonPath('$.type.id').value"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 311
    label "DocumentBuilderFactory.newInstance"
    function "newInstance"
    intent ""
    domain_entity "new"
    named_entities "instance,new"
    business_role "Domain Logic"
  ]
  node [
    id 312
    label "org.springframework.samples.petclinic.visits.model.Visit.getDescription"
    function "getDescription"
    intent "get"
    domain_entity "description"
    named_entities "description"
    business_role "Domain Model"
  ]
  node [
    id 313
    label "node.replace"
    function "replace"
    intent "replace"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 314
    label "org.springframework.samples.petclinic.api.application.CustomersServiceClient.getOwner"
    function "getOwner"
    intent "get"
    domain_entity "owner"
    named_entities "owner"
    business_role "Business Logic Layer"
  ]
  node [
    id 315
    label "getPetsInternal().add"
    function "add"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 316
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody"
    function "expectBody"
    intent "expect"
    domain_entity "body"
    named_entities "body"
    business_role "Business Logic Layer"
  ]
  node [
    id 317
    label "org.springframework.samples.petclinic.customers.model.PetType.getName"
    function "getName"
    intent "get"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Model"
  ]
  node [
    id 318
    label "OwnerDetails.OwnerDetailsBuilder.anOwnerDetails().pets(List.of(cat)).build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 319
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody().jsonPath('$.pets(0).name').isEqualTo"
    function "isEqualTo"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 320
    label "new ToStringCreator(this).append('id', this.getId()).append('name', this.getName()).append('birthDate', this.getBirthDate()).append('type', this.getType().getName()).append('ownerFirstname', this.getOwner().getFirstName()).append"
    function "append"
    intent ""
    domain_entity "append"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 321
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClient.setHostname"
    function "setHostname"
    intent "set"
    domain_entity "hostname"
    named_entities "hostname"
    business_role "Business Logic Layer"
  ]
  node [
    id 322
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.shouldGetAListOfVets"
    function "shouldGetAListOfVets"
    intent "get"
    domain_entity "list"
    named_entities "list,vet"
    business_role "API Layer"
  ]
  node [
    id 323
    label "ServerResponse.ok().contentType(MediaType.TEXT_HTML).bodyValue"
    function "bodyValue"
    intent ""
    domain_entity "body"
    named_entities "body,value"
    business_role "Domain Logic"
  ]
  node [
    id 324
    label "jsonPath('$.items(0).id').value"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 325
    label "jsonPath('$.items(2).id').value"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 326
    label "visitsServiceClient.getVisitsForPets(owner.getPetIds()).transform(it -> {      ReactiveCircuitBreaker cb = cbFactory.create('getOwnerDetails');      return cb.run(it, throwable -> emptyVisitsForPets());  }).map"
    function "map"
    intent ""
    domain_entity "map"
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 327
    label "jsonPath('$.items(1).id').value"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 328
    label "((SimpleVectorStore) this.vectorStore).save"
    function "save"
    intent "save"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 329
    label "this.getType().getName"
    function "getName"
    intent "get"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 330
    label "new ToStringCreator(this).append('id', this.getId()).append('name', this.getName()).append('birthDate', this.getBirthDate()).append('type', this.getType().getName()).append"
    function "append"
    intent ""
    domain_entity "append"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 331
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 332
    label "org.springframework.samples.petclinic.vets.model.Vet.getNrOfSpecialties"
    function "getNrOfSpecialties"
    intent "get"
    domain_entity "nr"
    named_entities "nr,specialties"
    business_role "Domain Model"
  ]
  node [
    id 333
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.setupPet"
    function "setupPet"
    intent ""
    domain_entity "setup"
    named_entities "pet"
    business_role "API Layer"
  ]
  node [
    id 334
    label "new Resilience4JConfigBuilder(id).circuitBreakerConfig"
    function "circuitBreakerConfig"
    intent ""
    domain_entity "circuit"
    named_entities "breaker,circuit,config"
    business_role "Configuration Layer"
  ]
  node [
    id 335
    label "callsSet.add"
    function "add"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 336
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.firstName"
    function "firstName"
    intent ""
    domain_entity "first"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 337
    label "transformer.setOutputProperty"
    function "setOutputProperty"
    intent "set"
    domain_entity "output"
    named_entities "output,property"
    business_role "Domain Logic"
  ]
  node [
    id 338
    label "method.getNameAsString"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "name,string"
    business_role "Domain Logic"
  ]
  node [
    id 339
    label "new ToStringCreator(this).append('id', this.getId()).append('lastName', this.getLastName()).append('firstName', this.getFirstName()).append('address', this.address).append('city', this.city).append('telephone', this.telephone).toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 340
    label "org.springframework.samples.petclinic.customers.model.PetType.setName"
    function "setName"
    intent "set"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Model"
  ]
  node [
    id 341
    label "method.getType().asString"
    function "asString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 342
    label "callGraph.values().forEach"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 343
    label "webClientBuilder.build().get().uri(hostname + 'pets/visits?petId={petId}', joinIds(petIds)).retrieve"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 344
    label "pet.setOwner"
    function "setOwner"
    intent "set"
    domain_entity "owner"
    named_entities "owner"
    business_role "Domain Logic"
  ]
  node [
    id 345
    label "this.chatClient.prompt().user(u -> u.text(query)).call().content"
    function "content"
    intent ""
    domain_entity "content"
    named_entities "content"
    business_role "Business Logic Layer"
  ]
  node [
    id 346
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody().jsonPath('$.pets(0).name').isEqualTo('Garfield').jsonPath"
    function "jsonPath"
    intent ""
    domain_entity "json"
    named_entities "json,path"
    business_role "Business Logic Layer"
  ]
  node [
    id 347
    label "mvc.perform(get('/owners/2/pets/2').accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk()).andExpect(content().contentType('application/json')).andExpect(jsonPath('$.id').value(2)).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 348
    label "i.toString().trim"
    function "trim"
    intent "trim"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 349
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody().jsonPath('$.pets(0).name').isEqualTo('Garfield').jsonPath('$.pets(0).visits(0).description').isEqualTo"
    function "isEqualTo"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 350
    label "visits.items"
    function "items"
    intent ""
    domain_entity "item"
    named_entities "item"
    business_role "Domain Logic"
  ]
  node [
    id 351
    label "webClient.get().uri(ownersHostname + 'owners').retrieve().bodyToMono"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "body,mono"
    business_role "API Layer"
  ]
  node [
    id 352
    label "new File(OUTPUT_DIR).mkdirs"
    function "mkdirs"
    intent ""
    domain_entity "mkdir"
    named_entities "mkdir"
    business_role "Domain Logic"
  ]
  node [
    id 353
    label "this.chatClient.prompt().user"
    function "user"
    intent ""
    domain_entity "user"
    named_entities "user"
    business_role "Business Logic Layer"
  ]
  node [
    id 354
    label "org.springframework.samples.petclinic.vets.model.Vet.setId"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "d,i"
    business_role "Domain Model"
  ]
  node [
    id 355
    label "org.springframework.samples.petclinic.customers.model.Pet.setType"
    function "setType"
    intent "set"
    domain_entity "type"
    named_entities "type"
    business_role "Domain Model"
  ]
  node [
    id 356
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.petId"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Domain Model"
  ]
  node [
    id 357
    label "TimeLimiterRegistry.ofDefaults"
    function "ofDefaults"
    intent ""
    domain_entity "default"
    named_entities "default"
    business_role "Domain Logic"
  ]
  node [
    id 358
    label "org.springframework.samples.petclinic.customers.model.Pet"
    function "Pet"
    intent ""
    domain_entity "pet"
    named_entities "pet"
    business_role "Domain Model"
  ]
  node [
    id 359
    label "this.server.enqueue"
    function "enqueue"
    intent ""
    domain_entity "enqueue"
    named_entities "enqueue"
    business_role "Domain Logic"
  ]
  node [
    id 360
    label "node.replace('\'', ''').replace('\n', ' ').replace"
    function "replace"
    intent "replace"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 361
    label "org.springframework.samples.petclinic.api.ApiGatewayApplicationTests.contextLoads"
    function "contextLoads"
    intent ""
    domain_entity "context"
    named_entities "context,load"
    business_role "Domain Logic"
  ]
  node [
    id 362
    label "node.replace('\'', ''').replace"
    function "replace"
    intent "replace"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 363
    label "SearchRequest.defaults"
    function "defaults"
    intent ""
    domain_entity "default"
    named_entities "default"
    business_role "Domain Logic"
  ]
  node [
    id 364
    label "documents.size"
    function "size"
    intent ""
    domain_entity "size"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 365
    label "org.springframework.samples.petclinic.genai.AIBeanConfiguration.vectorStore"
    function "vectorStore"
    intent ""
    domain_entity "vector"
    named_entities "store,vector"
    business_role "Configuration Layer"
  ]
  node [
    id 366
    label "org.springframework.samples.petclinic.vets.web.VetResource"
    function "VetResource"
    intent ""
    domain_entity "vet"
    named_entities "resource,vet"
    business_role "API Layer"
  ]
  node [
    id 367
    label "org.springframework.samples.petclinic.genai.GenAIServiceApplication"
    function "GenAIServiceApplication"
    intent ""
    domain_entity "gen"
    named_entities "ai,application,gen,service"
    business_role "Business Logic Layer"
  ]
  node [
    id 368
    label "ownerRepository.findById(ownerId).orElseThrow"
    function "orElseThrow"
    intent ""
    domain_entity "else"
    named_entities "else"
    business_role "Data Access Layer"
  ]
  node [
    id 369
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication.loadBalancedRestTemplate"
    function "loadBalancedRestTemplate"
    intent "load"
    domain_entity "balanced"
    named_entities "balanced,rest,template"
    business_role "Domain Logic"
  ]
  node [
    id 370
    label "c.getScope().map"
    function "map"
    intent ""
    domain_entity "map"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 371
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayControllerTest"
    function "ApiGatewayControllerTest"
    intent ""
    domain_entity "api"
    named_entities "api,controller,gateway,test"
    business_role "API Layer"
  ]
  node [
    id 372
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder"
    function "PetDetailsBuilder"
    intent ""
    domain_entity "pet"
    named_entities "builder,details,pet"
    business_role "Domain Logic"
  ]
  node [
    id 373
    label "CircuitBreakerConfig.ofDefaults"
    function "ofDefaults"
    intent ""
    domain_entity "default"
    named_entities "default"
    business_role "Configuration Layer"
  ]
  node [
    id 374
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.aPetDetails"
    function "aPetDetails"
    intent ""
    domain_entity "pet"
    named_entities "detail,pet"
    business_role "Domain Logic"
  ]
  node [
    id 375
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.given"
    function "given"
    intent "give"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 376
    label "org.springframework.samples.petclinic.vets.model.Vet.setFirstName"
    function "setFirstName"
    intent "set"
    domain_entity "first"
    named_entities "first,name"
    business_role "Domain Model"
  ]
  node [
    id 377
    label "visit.setDescription"
    function "setDescription"
    intent "set"
    domain_entity "description"
    named_entities "description"
    business_role "Domain Logic"
  ]
  node [
    id 378
    label "ServerResponse.ok"
    function "ok"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 379
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody().jsonPath('$.pets(0).name').isEqualTo('Garfield').jsonPath('$.pets(0).visits').isEmpty"
    function "isEmpty"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 380
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.shouldGetAPetInJSonFormat"
    function "shouldGetAPetInJSonFormat"
    intent "get"
    domain_entity "pet"
    named_entities "format,j,pet,son"
    business_role "API Layer"
  ]
  node [
    id 381
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest"
    function "VisitResourceTest"
    intent "visit"
    domain_entity "resource"
    named_entities "resource,test"
    business_role "API Layer"
  ]
  node [
    id 382
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.id"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "d"
    business_role "Domain Logic"
  ]
  node [
    id 383
    label "new ToStringCreator(this).append('id', this.getId()).append('lastName', this.getLastName()).append('firstName', this.getFirstName()).append"
    function "append"
    intent ""
    domain_entity "append"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 384
    label "org.springframework.samples.petclinic.vets.model.Vet.getSpecialties"
    function "getSpecialties"
    intent "get"
    domain_entity "specialty"
    named_entities "specialty"
    business_role "Domain Model"
  ]
  node [
    id 385
    label "this.getLastName"
    function "getLastName"
    intent "get"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 386
    label "org.springframework.samples.petclinic.customers.model.Pet.getType"
    function "getType"
    intent "get"
    domain_entity "type"
    named_entities "type"
    business_role "Domain Model"
  ]
  node [
    id 387
    label "org.springframework.samples.petclinic.genai.AIFunctionConfiguration.addPetToOwner"
    function "addPetToOwner"
    intent "add"
    domain_entity "pet"
    named_entities "owner,pet,to"
    business_role "Configuration Layer"
  ]
  node [
    id 388
    label "jsonPath('$(0).id').value"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 389
    label "clazz.findAll(MethodDeclaration.class).forEach"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 390
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.telephone"
    function "telephone"
    intent ""
    domain_entity "telephone"
    named_entities "telephone"
    business_role "Domain Logic"
  ]
  node [
    id 391
    label "json.getBytes"
    function "getBytes"
    intent "get"
    domain_entity "byte"
    named_entities "byte"
    business_role "Domain Logic"
  ]
  node [
    id 392
    label "classMethods.values().forEach"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 393
    label "new ToStringCreator(this).append('id', this.getId()).append('name', this.getName()).append('birthDate', this.getBirthDate()).append"
    function "append"
    intent ""
    domain_entity "append"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 394
    label "org.springframework.samples.petclinic.visits.model.VisitRepository"
    function "VisitRepository"
    intent "visit"
    domain_entity "repository"
    named_entities "repository"
    business_role "Data Access Layer"
  ]
  node [
    id 395
    label "cu.getImports"
    function "getImports"
    intent "get"
    domain_entity "import"
    named_entities "import"
    business_role "Domain Logic"
  ]
  node [
    id 396
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.asList"
    function "asList"
    intent ""
    domain_entity "list"
    named_entities "list"
    business_role "API Layer"
  ]
  node [
    id 397
    label "org.springframework.samples.petclinic.visits.config.MetricConfig"
    function "MetricConfig"
    intent ""
    domain_entity "metric"
    named_entities "config,metric"
    business_role "Configuration Layer"
  ]
  node [
    id 398
    label "org.springframework.samples.petclinic.visits.model.Visit.description"
    function "description"
    intent ""
    domain_entity "description"
    named_entities "description"
    business_role "Domain Model"
  ]
  node [
    id 399
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.shouldFetchVisits"
    function "shouldFetchVisits"
    intent "fetch"
    domain_entity "visit"
    named_entities "fetch,visit"
    business_role "API Layer"
  ]
  node [
    id 400
    label "Mono.just"
    function "just"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 401
    label "PosixFilePermissions.asFileAttribute"
    function "asFileAttribute"
    intent ""
    domain_entity "file"
    named_entities "attribute,file"
    business_role "Domain Logic"
  ]
  node [
    id 402
    label "org.springframework.samples.petclinic.customers.model.Pet.setOwner"
    function "setOwner"
    intent "set"
    domain_entity "owner"
    named_entities "owner"
    business_role "Domain Model"
  ]
  node [
    id 403
    label "this.chatClient.prompt"
    function "prompt"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 404
    label "org.springframework.samples.petclinic.visits.model.Visit"
    function "Visit"
    intent "visit"
    domain_entity ""
    named_entities ""
    business_role "Domain Model"
  ]
  node [
    id 405
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.content"
    function "content"
    intent ""
    domain_entity "content"
    named_entities "content"
    business_role "API Layer"
  ]
  node [
    id 406
    label "RouterFunctions.resources('/**', new ClassPathResource('static/')).andRoute"
    function "andRoute"
    intent ""
    domain_entity "route"
    named_entities "route"
    business_role "API Layer"
  ]
  node [
    id 407
    label "Visit.VisitBuilder.aVisit().id(3).petId(222).build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 408
    label "getSpecialtiesInternal().add"
    function "add"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 409
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClient.joinIds"
    function "joinIds"
    intent "join"
    domain_entity "ids"
    named_entities "ids"
    business_role "Business Logic Layer"
  ]
  node [
    id 410
    label "classMethods.values"
    function "values"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 411
    label "entry.getValue"
    function "getValue"
    intent "get"
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 412
    label "PropertyComparator.sort"
    function "sort"
    intent ""
    domain_entity "sort"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 413
    label "Files.createTempFile"
    function "createTempFile"
    intent "create"
    domain_entity "temp"
    named_entities "file,temp"
    business_role "Domain Logic"
  ]
  node [
    id 414
    label "i.toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 415
    label "webClientBuilder.build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 416
    label "Visit.VisitBuilder.aVisit"
    function "aVisit"
    intent ""
    domain_entity "visit"
    named_entities "visit"
    business_role "Domain Logic"
  ]
  node [
    id 417
    label "org.springframework.samples.petclinic.visits.model.Visit.petId"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Domain Model"
  ]
  node [
    id 418
    label "clazz.getNameAsString"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "name,string"
    business_role "Domain Logic"
  ]
  node [
    id 419
    label "org.springframework.samples.petclinic.config.PetclinicConfigServerApplicationTests"
    function "PetclinicConfigServerApplicationTests"
    intent ""
    domain_entity "petclinic"
    named_entities "application,config,petclinic,server,tests"
    business_role "Configuration Layer"
  ]
  node [
    id 420
    label "org.springframework.samples.petclinic.genai.GenAIServiceApplication.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 421
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect(jsonPath('$.items(0).id').value(1)).andExpect(jsonPath('$.items(1).id').value(2)).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 422
    label "org.springframework.samples.petclinic.customers.model.Pet.hashCode"
    function "hashCode"
    intent "hash"
    domain_entity "code"
    named_entities "code,hash"
    business_role "Domain Model"
  ]
  node [
    id 423
    label "org.springframework.samples.petclinic.customers.model.Owner.getPetsInternal"
    function "getPetsInternal"
    intent "get"
    domain_entity "pets"
    named_entities "internal,pets"
    business_role "Domain Model"
  ]
  node [
    id 424
    label "s.toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 425
    label "org.springframework.samples.petclinic.visits.VisitsServiceApplication.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 426
    label "org.springframework.samples.petclinic.discovery.DiscoveryServerApplication.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 427
    label "new ToStringCreator(this).append('id', this.getId()).append('lastName', this.getLastName()).append('firstName', this.getFirstName()).append('address', this.address).append('city', this.city).append"
    function "append"
    intent ""
    domain_entity "append"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 428
    label "PetDetails.PetDetailsBuilder.aPetDetails().id"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "d"
    business_role "Domain Logic"
  ]
  node [
    id 429
    label "((SimpleVectorStore) this.vectorStore).load"
    function "load"
    intent ""
    domain_entity "load"
    named_entities "load"
    business_role "Domain Logic"
  ]
  node [
    id 430
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.birthDate"
    function "birthDate"
    intent ""
    domain_entity "birth"
    named_entities "birth,date"
    business_role "Domain Logic"
  ]
  node [
    id 431
    label "clazz.findAll"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 432
    label "org.springframework.samples.petclinic.customers.model.Pet.setId"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "d,i"
    business_role "Domain Model"
  ]
  node [
    id 433
    label "visits.items().get"
    function "get"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 434
    label "Visit.VisitBuilder.aVisit().id"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "d"
    business_role "Domain Logic"
  ]
  node [
    id 435
    label "registry.config().commonTags"
    function "commonTags"
    intent ""
    domain_entity "tags"
    named_entities "tags"
    business_role "Configuration Layer"
  ]
  node [
    id 436
    label "mvc.perform"
    function "perform"
    intent "perform"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 437
    label "petclinicAiProvider.getVets"
    function "getVets"
    intent "get"
    domain_entity "vet"
    named_entities "vet"
    business_role "Domain Logic"
  ]
  node [
    id 438
    label "config.setLanguageLevel"
    function "setLanguageLevel"
    intent "set"
    domain_entity "language"
    named_entities "language,level"
    business_role "Configuration Layer"
  ]
  node [
    id 439
    label "org.springframework.samples.petclinic.customers.model.Owner.addPet"
    function "addPet"
    intent "add"
    domain_entity "pet"
    named_entities "pet"
    business_role "Domain Model"
  ]
  node [
    id 440
    label "jsonPath('$.id').value"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 441
    label "reader.get"
    function "get"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 442
    label "PetDetails.PetDetailsBuilder.aPetDetails"
    function "aPetDetails"
    intent ""
    domain_entity "pet"
    named_entities "detail,pet"
    business_role "Domain Logic"
  ]
  node [
    id 443
    label "jsonPath('$.name').value"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 444
    label "objectMapper.writeValueAsString"
    function "writeValueAsString"
    intent "write"
    domain_entity "value"
    named_entities "string,value"
    business_role "Domain Logic"
  ]
  node [
    id 445
    label "customersServiceClient.getOwner(ownerId).flatMap"
    function "flatMap"
    intent ""
    domain_entity "map"
    named_entities "map"
    business_role "Business Logic Layer"
  ]
  node [
    id 446
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect(jsonPath('$.items(0).id').value(1)).andExpect(jsonPath('$.items(1).id').value(2)).andExpect(jsonPath('$.items(2).id').value(3)).andExpect(jsonPath('$.items(0).petId').value(111)).andExpect(jsonPath('$.items(1).petId').value(222)).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 447
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.setUp"
    function "setUp"
    intent "set"
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 448
    label "request.telephone"
    function "telephone"
    intent ""
    domain_entity "telephone"
    named_entities "telephone"
    business_role "Domain Logic"
  ]
  node [
    id 449
    label "this.vectorStore.add"
    function "add"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 450
    label "owner.pets"
    function "pets"
    intent ""
    domain_entity "pet"
    named_entities "pet"
    business_role "Domain Logic"
  ]
  node [
    id 451
    label "ref.getScope().toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 452
    label "org.springframework.samples.petclinic.customers.model.PetRepository.findPetTypeById"
    function "findPetTypeById"
    intent "find"
    domain_entity "pet"
    named_entities "d,i,pet,type"
    business_role "Data Access Layer"
  ]
  node [
    id 453
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.status"
    function "status"
    intent ""
    domain_entity "status"
    named_entities "status"
    business_role "API Layer"
  ]
  node [
    id 454
    label "TransformerFactory.newInstance"
    function "newInstance"
    intent ""
    domain_entity "new"
    named_entities "instance,new"
    business_role "Domain Logic"
  ]
  node [
    id 455
    label "request.address"
    function "address"
    intent ""
    domain_entity "address"
    named_entities "address"
    business_role "Domain Logic"
  ]
  node [
    id 456
    label "getSpecialtiesInternal().size"
    function "size"
    intent ""
    domain_entity "size"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 457
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.description"
    function "description"
    intent ""
    domain_entity "description"
    named_entities "description"
    business_role "Domain Model"
  ]
  node [
    id 458
    label "org.springframework.samples.petclinic.customers.web.PetResource.getPetTypes"
    function "getPetTypes"
    intent "get"
    domain_entity "pet"
    named_entities "pet,types"
    business_role "API Layer"
  ]
  node [
    id 459
    label "this.getBirthDate"
    function "getBirthDate"
    intent "get"
    domain_entity "birth"
    named_entities "birth,date"
    business_role "Domain Logic"
  ]
  node [
    id 460
    label "org.springframework.samples.petclinic.api.boundary.web.FallbackController"
    function "FallbackController"
    intent ""
    domain_entity "fallback"
    named_entities "controller,fallback"
    business_role "API Layer"
  ]
  node [
    id 461
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor.exportStaticGraphGML"
    function "exportStaticGraphGML"
    intent ""
    domain_entity "export"
    named_entities "export,gml,graph,static"
    business_role "Domain Logic"
  ]
  node [
    id 462
    label "doc.appendChild"
    function "appendChild"
    intent "append"
    domain_entity "child"
    named_entities "child"
    business_role "Domain Logic"
  ]
  node [
    id 463
    label "List.of"
    function "of"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 464
    label "client.get"
    function "get"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 465
    label "Visit.VisitBuilder.aVisit().id(3).petId"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Domain Logic"
  ]
  node [
    id 466
    label "org.springframework.samples.petclinic.visits.model.Visit.getDate"
    function "getDate"
    intent "get"
    domain_entity "date"
    named_entities "date"
    business_role "Domain Model"
  ]
  node [
    id 467
    label "ownerEntityMapper.map"
    function "map"
    intent ""
    domain_entity "map"
    named_entities ""
    business_role "Domain Model"
  ]
  node [
    id 468
    label "org.springframework.samples.petclinic.customers.web.mapper.Mapper"
    function "Mapper"
    intent ""
    domain_entity ""
    named_entities "mapper"
    business_role "API Layer"
  ]
  node [
    id 469
    label "org.springframework.samples.petclinic.customers.web.PetResource.findPetById"
    function "findPetById"
    intent "find"
    domain_entity "pet"
    named_entities "d,pet"
    business_role "API Layer"
  ]
  node [
    id 470
    label "owner.setLastName"
    function "setLastName"
    intent "set"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 471
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.get"
    function "get"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 472
    label "org.springframework.samples.petclinic.vets.model.Vet.getLastName"
    function "getLastName"
    intent "get"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Model"
  ]
  node [
    id 473
    label "org.springframework.samples.petclinic.visits.config.MetricConfig.timedAspect"
    function "timedAspect"
    intent "time"
    domain_entity "aspect"
    named_entities "aspect"
    business_role "Configuration Layer"
  ]
  node [
    id 474
    label "org.springframework.samples.petclinic.customers.model.Pet.toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Model"
  ]
  node [
    id 475
    label "org.springframework.samples.petclinic.customers.web.mapper.Mapper.map"
    function "map"
    intent ""
    domain_entity "map"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 476
    label "this.getOwner().getLastName"
    function "getLastName"
    intent "get"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 477
    label "webClient.get().uri(ownersHostname + 'owners').retrieve"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 478
    label "org.springframework.samples.petclinic.api.boundary.web.CircuitBreakerConfiguration.timeLimiterRegistry"
    function "timeLimiterRegistry"
    intent ""
    domain_entity "time"
    named_entities "limiter,registry,time"
    business_role "API Layer"
  ]
  node [
    id 479
    label "org.springframework.samples.petclinic.genai.AIDataProvider.getVets"
    function "getVets"
    intent "get"
    domain_entity "vet"
    named_entities "vet"
    business_role "Domain Logic"
  ]
  node [
    id 480
    label "visit.setPetId"
    function "setPetId"
    intent "set"
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Domain Logic"
  ]
  node [
    id 481
    label "org.springframework.samples.petclinic.customers.model.PetRepository"
    function "PetRepository"
    intent ""
    domain_entity "pet"
    named_entities "pet,repository"
    business_role "Data Access Layer"
  ]
  node [
    id 482
    label "org.springframework.samples.petclinic.customers.model.Owner.getAddress"
    function "getAddress"
    intent "get"
    domain_entity "address"
    named_entities "address"
    business_role "Domain Model"
  ]
  node [
    id 483
    label "new ToStringCreator(this).append('id', this.getId()).append('name', this.getName()).append('birthDate', this.getBirthDate()).append('type', this.getType().getName()).append('ownerFirstname', this.getOwner().getFirstName()).append('ownerLastname', this.getOwner().getLastName()).toString"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "string"
    business_role "Domain Logic"
  ]
  node [
    id 484
    label "file.getAbsolutePath"
    function "getAbsolutePath"
    intent "get"
    domain_entity "absolute"
    named_entities "absolute,path"
    business_role "Domain Logic"
  ]
  node [
    id 485
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication"
    function "ApiGatewayApplication"
    intent ""
    domain_entity "api"
    named_entities "api,application,gateway"
    business_role "Domain Logic"
  ]
  node [
    id 486
    label "mvc.perform(get('/owners/2/pets/2').accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk()).andExpect(content().contentType('application/json')).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 487
    label "callGraph.computeIfAbsent(fullMethodName, k -> new HashSet<>()).add"
    function "add"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 488
    label "org.springframework.samples.petclinic.visits.model.Visit.aVisit"
    function "aVisit"
    intent ""
    domain_entity "visit"
    named_entities "visit"
    business_role "Domain Model"
  ]
  node [
    id 489
    label "visits.items().size"
    function "size"
    intent ""
    domain_entity "size"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 490
    label "petType.setId"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "d,i"
    business_role "Domain Logic"
  ]
  node [
    id 491
    label "org.springframework.samples.petclinic.customers.web.OwnerResource.updateOwner"
    function "updateOwner"
    intent ""
    domain_entity "update"
    named_entities "owner"
    business_role "API Layer"
  ]
  node [
    id 492
    label "org.springframework.samples.petclinic.customers.model.Pet.setBirthDate"
    function "setBirthDate"
    intent "set"
    domain_entity "birth"
    named_entities "birth,date"
    business_role "Domain Model"
  ]
  node [
    id 493
    label "webClient.get().uri"
    function "uri"
    intent ""
    domain_entity "uri"
    named_entities "uri"
    business_role "API Layer"
  ]
  node [
    id 494
    label "cu.findAll(ClassOrInterfaceDeclaration.class).forEach"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 495
    label "org.springframework.samples.petclinic.vets.model.Vet.setLastName"
    function "setLastName"
    intent "set"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Model"
  ]
  node [
    id 496
    label "cu.getPackageDeclaration().map"
    function "map"
    intent ""
    domain_entity "map"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 497
    label "resource.getFile"
    function "getFile"
    intent "get"
    domain_entity "file"
    named_entities "file"
    business_role "API Layer"
  ]
  node [
    id 498
    label "this.getFirstName"
    function "getFirstName"
    intent "get"
    domain_entity "first"
    named_entities "first,name"
    business_role "Domain Logic"
  ]
  node [
    id 499
    label "pkg.isEmpty"
    function "isEmpty"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 500
    label "transformer.transform"
    function "transform"
    intent "transform"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 501
    label "org.springframework.samples.petclinic.genai.PetclinicChatClient"
    function "PetclinicChatClient"
    intent ""
    domain_entity "petclinic"
    named_entities "chat,client,petclinic"
    business_role "Business Logic Layer"
  ]
  node [
    id 502
    label "org.springframework.samples.petclinic.customers.model.Owner.getTelephone"
    function "getTelephone"
    intent "get"
    domain_entity "telephone"
    named_entities "telephone"
    business_role "Domain Model"
  ]
  node [
    id 503
    label "visitRepository.findByPetId"
    function "findByPetId"
    intent "find"
    domain_entity "pet"
    named_entities "d,i,pet"
    business_role "Data Access Layer"
  ]
  node [
    id 504
    label "visits.items().get(0).description"
    function "description"
    intent ""
    domain_entity "description"
    named_entities "description"
    business_role "Domain Logic"
  ]
  node [
    id 505
    label "entry.getKey"
    function "getKey"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 506
    label "org.springframework.samples.petclinic.customers.web.mapper.OwnerEntityMapper"
    function "OwnerEntityMapper"
    intent ""
    domain_entity "owner"
    named_entities "entity,mapper,owner"
    business_role "API Layer"
  ]
  node [
    id 507
    label "server.url"
    function "url"
    intent ""
    domain_entity "url"
    named_entities "url"
    business_role "Domain Logic"
  ]
  node [
    id 508
    label "org.springframework.samples.petclinic.api.application.CustomersServiceClient"
    function "CustomersServiceClient"
    intent ""
    domain_entity "customers"
    named_entities "client,customer,service"
    business_role "Business Logic Layer"
  ]
  node [
    id 509
    label "get('/vets').accept"
    function "accept"
    intent "accept"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 510
    label "given(visitRepository.findByPetIdIn(asList(111, 222))).willReturn"
    function "willReturn"
    intent "return"
    domain_entity ""
    named_entities ""
    business_role "Data Access Layer"
  ]
  node [
    id 511
    label "pd.getNameAsString"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "name,string"
    business_role "Domain Logic"
  ]
  node [
    id 512
    label "node.replace('\'', ''').replace('\n', ' ').replace('\r', ' ').replace('(', '(').replace"
    function "replace"
    intent "replace"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 513
    label "webClient.post().uri(ownersHostname + 'owners/' + request.ownerId() + '/pets').bodyValue(request.pet()).retrieve().bodyToMono"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "body,mono"
    business_role "API Layer"
  ]
  node [
    id 514
    label "petRepository.findPetTypes"
    function "findPetTypes"
    intent "find"
    domain_entity "pet"
    named_entities "pet,types"
    business_role "Data Access Layer"
  ]
  node [
    id 515
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.type"
    function "type"
    intent ""
    domain_entity "type"
    named_entities "type"
    business_role "Domain Logic"
  ]
  node [
    id 516
    label "petclinicAiProvider.getAllOwners"
    function "getAllOwners"
    intent "get"
    domain_entity "owner"
    named_entities "owner"
    business_role "Domain Logic"
  ]
  node [
    id 517
    label "response.setHeader('Content-Type', 'application/json').setBody"
    function "setBody"
    intent "set"
    domain_entity "body"
    named_entities "body"
    business_role "Domain Logic"
  ]
  node [
    id 518
    label "javaFiles.add"
    function "add"
    intent "add"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 519
    label "petRepository.findPetTypeById(petRequest.typeId()).ifPresent"
    function "ifPresent"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Data Access Layer"
  ]
  node [
    id 520
    label "request.lastName"
    function "lastName"
    intent ""
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 521
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.pets"
    function "pets"
    intent ""
    domain_entity "pet"
    named_entities "pet"
    business_role "Domain Logic"
  ]
  node [
    id 522
    label "topMatches.stream().map(Document::getContent).toList"
    function "toList"
    intent ""
    domain_entity "list"
    named_entities "list"
    business_role "Domain Logic"
  ]
  node [
    id 523
    label "org.springframework.samples.petclinic.api.ApiGatewayApplicationTests"
    function "ApiGatewayApplicationTests"
    intent "test"
    domain_entity "api"
    named_entities "api,application,gateway,tests"
    business_role "Domain Logic"
  ]
  node [
    id 524
    label "jsonPath('$.items(2).petId').value"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "value"
    business_role "Domain Logic"
  ]
  node [
    id 525
    label "Files.createTempFile('vectorstore', '.json', attr).toFile"
    function "toFile"
    intent "file"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 526
    label "org.springframework.samples.petclinic.vets.model.Vet.getSpecialtiesInternal"
    function "getSpecialtiesInternal"
    intent "get"
    domain_entity "specialties"
    named_entities "specialties"
    business_role "Domain Model"
  ]
  node [
    id 527
    label "org.springframework.samples.petclinic.customers.model.PetType"
    function "PetType"
    intent ""
    domain_entity "pet"
    named_entities "pet,type"
    business_role "Domain Model"
  ]
  node [
    id 528
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.status"
    function "status"
    intent ""
    domain_entity "status"
    named_entities "status"
    business_role "API Layer"
  ]
  node [
    id 529
    label "webClientBuilder.build().get"
    function "get"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 530
    label "org.springframework.samples.petclinic.customers.model.Owner.getId"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "d,i"
    business_role "Domain Model"
  ]
  node [
    id 531
    label "org.springframework.samples.petclinic.customers.model.Owner.setLastName"
    function "setLastName"
    intent "set"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Model"
  ]
  node [
    id 532
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Domain Model"
  ]
  node [
    id 533
    label "org.springframework.samples.petclinic.customers.web.OwnerResource.findAll"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 534
    label "this.getName"
    function "getName"
    intent "get"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Logic"
  ]
  node [
    id 535
    label "visits.items().stream().filter"
    function "filter"
    intent "filter"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 536
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.jsonPath"
    function "jsonPath"
    intent ""
    domain_entity "json"
    named_entities "json,path"
    business_role "API Layer"
  ]
  node [
    id 537
    label "org.springframework.samples.petclinic.customers.model.Owner.setTelephone"
    function "setTelephone"
    intent "set"
    domain_entity "telephone"
    named_entities "telephone"
    business_role "Domain Model"
  ]
  node [
    id 538
    label "response.setHeader"
    function "setHeader"
    intent "set"
    domain_entity "header"
    named_entities "header"
    business_role "Domain Logic"
  ]
  node [
    id 539
    label "SearchRequest.from(SearchRequest.defaults()).withQuery(vetAsJson).withTopK"
    function "withTopK"
    intent ""
    domain_entity "k"
    named_entities "k"
    business_role "Domain Logic"
  ]
  node [
    id 540
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 541
    label "Mockito.when(visitsServiceClient.getVisitsForPets(Collections.singletonList(cat.id()))).thenReturn"
    function "thenReturn"
    intent "return"
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 542
    label "webClient.post().uri(ownersHostname + 'owners').bodyValue(ownerRequest).retrieve().bodyToMono(OwnerDetails.class).block"
    function "block"
    intent ""
    domain_entity "block"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 543
    label "org.springframework.samples.petclinic.vets.model.VetRepository"
    function "VetRepository"
    intent ""
    domain_entity "vet"
    named_entities "repository,vet"
    business_role "Data Access Layer"
  ]
  node [
    id 544
    label "org.springframework.samples.petclinic.genai.AIBeanConfiguration.chatMemory"
    function "chatMemory"
    intent ""
    domain_entity "chat"
    named_entities "memory"
    business_role "Configuration Layer"
  ]
  node [
    id 545
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayController"
    function "ApiGatewayController"
    intent ""
    domain_entity "api"
    named_entities "api,controller,gateway"
    business_role "API Layer"
  ]
  node [
    id 546
    label "request.city"
    function "city"
    intent ""
    domain_entity "city"
    named_entities "city"
    business_role "Domain Logic"
  ]
  node [
    id 547
    label "method.findAll(MethodCallExpr.class).forEach"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 548
    label "TimeLimiterConfig.custom().timeoutDuration"
    function "timeoutDuration"
    intent ""
    domain_entity "timeout"
    named_entities "duration,timeout"
    business_role "Configuration Layer"
  ]
  node [
    id 549
    label "webClient.get().uri(vetsHostname + 'vets').retrieve"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 550
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.given"
    function "given"
    intent "give"
    domain_entity ""
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 551
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.build"
    function "build"
    intent "build"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 552
    label "node.replace('\'', ''').replace('\n', ' ').replace('\r', ' ').replace('(', '(').replace(')', ')').trim"
    function "trim"
    intent "trim"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 553
    label "new Resilience4JConfigBuilder(id).circuitBreakerConfig(CircuitBreakerConfig.ofDefaults()).timeLimiterConfig"
    function "timeLimiterConfig"
    intent ""
    domain_entity "time"
    named_entities "config,limiter,time"
    business_role "Configuration Layer"
  ]
  node [
    id 554
    label "org.springframework.samples.petclinic.genai.AIFunctionConfiguration"
    function "AIFunctionConfiguration"
    intent ""
    domain_entity "ai"
    named_entities "ai,configuration,function"
    business_role "Configuration Layer"
  ]
  node [
    id 555
    label "org.springframework.samples.petclinic.discovery.DiscoveryServerApplicationTests"
    function "DiscoveryServerApplicationTests"
    intent ""
    domain_entity "discovery"
    named_entities "application,discovery,server,tests"
    business_role "Domain Logic"
  ]
  node [
    id 556
    label "consumer.accept"
    function "accept"
    intent "accept"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 557
    label "WebClient.builder"
    function "builder"
    intent ""
    domain_entity "builder"
    named_entities "builder"
    business_role "API Layer"
  ]
  node [
    id 558
    label "org.springframework.samples.petclinic.customers.model.Pet.getClass"
    function "getClass"
    intent "get"
    domain_entity "class"
    named_entities "class"
    business_role "Domain Model"
  ]
  node [
    id 559
    label "org.springframework.samples.petclinic.genai.PetclinicChatClient.exchange"
    function "exchange"
    intent ""
    domain_entity "exchange"
    named_entities "exchange"
    business_role "Business Logic Layer"
  ]
  node [
    id 560
    label "request.vet"
    function "vet"
    intent ""
    domain_entity "vet"
    named_entities "vet"
    business_role "Domain Logic"
  ]
  node [
    id 561
    label "org.springframework.samples.petclinic.genai.AIBeanConfiguration"
    function "AIBeanConfiguration"
    intent ""
    domain_entity "ai"
    named_entities "ai,bean,configuration"
    business_role "Configuration Layer"
  ]
  node [
    id 562
    label "org.springframework.samples.petclinic.customers.model.Pet.setName"
    function "setName"
    intent "set"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Model"
  ]
  node [
    id 563
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.id"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "d"
    business_role "Domain Logic"
  ]
  node [
    id 564
    label "webClient.get().uri(vetsHostname + 'vets').retrieve().bodyToMono(new ParameterizedTypeReference<List<Vet>>() {  }).block"
    function "block"
    intent ""
    domain_entity "block"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 565
    label "factory.configureDefault"
    function "configureDefault"
    intent ""
    domain_entity "configure"
    named_entities "configure,default"
    business_role "Configuration Layer"
  ]
  node [
    id 566
    label "Duration.ofSeconds"
    function "ofSeconds"
    intent ""
    domain_entity "second"
    named_entities "second"
    business_role "Domain Logic"
  ]
  node [
    id 567
    label "e.setAttribute"
    function "setAttribute"
    intent "set"
    domain_entity "attribute"
    named_entities "attribute"
    business_role "Domain Logic"
  ]
  node [
    id 568
    label "org.springframework.samples.petclinic.vets.model.Specialty"
    function "Specialty"
    intent ""
    domain_entity "specialty"
    named_entities "specialty"
    business_role "Domain Model"
  ]
  node [
    id 569
    label "webClient.post().uri(ownersHostname + 'owners/' + request.ownerId() + '/pets').bodyValue(request.pet()).retrieve"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities ""
    business_role "API Layer"
  ]
  node [
    id 570
    label "org.springframework.samples.petclinic.genai.AIDataProvider.getAllOwners"
    function "getAllOwners"
    intent "get"
    domain_entity "owner"
    named_entities "owner"
    business_role "Domain Logic"
  ]
  node [
    id 571
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.assertNotNull"
    function "assertNotNull"
    intent "assert"
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 572
    label "Paths.get"
    function "get"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 573
    label "org.springframework.samples.petclinic.customers.web.OwnerResource.createOwner"
    function "createOwner"
    intent "create"
    domain_entity "owner"
    named_entities "owner"
    business_role "API Layer"
  ]
  node [
    id 574
    label "client.get().uri('/api/gateway/owners/1').exchange"
    function "exchange"
    intent ""
    domain_entity "exchange"
    named_entities "exchange"
    business_role "Business Logic Layer"
  ]
  node [
    id 575
    label "topMatches.stream"
    function "stream"
    intent ""
    domain_entity "stream"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 576
    label "call.getNameAsString"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "name,string"
    business_role "Domain Logic"
  ]
  node [
    id 577
    label "Document.getContent"
    function "getContent"
    intent "get"
    domain_entity "content"
    named_entities "content"
    business_role "Domain Logic"
  ]
  node [
    id 578
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayControllerTest.getOwnerDetails_withServiceError"
    function "getOwnerDetails_withServiceError"
    intent "get"
    domain_entity "owner"
    named_entities "details,error,owner,service"
    business_role "API Layer"
  ]
  node [
    id 579
    label "org.springframework.samples.petclinic.customers.model.Owner.getLastName"
    function "getLastName"
    intent "get"
    domain_entity "name"
    named_entities "name"
    business_role "Domain Model"
  ]
  node [
    id 580
    label "visits.block"
    function "block"
    intent ""
    domain_entity "block"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 581
    label "org.springframework.samples.petclinic.customers.web.OwnerResource"
    function "OwnerResource"
    intent ""
    domain_entity "owner"
    named_entities "owner,resource"
    business_role "API Layer"
  ]
  node [
    id 582
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 583
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk"
    function "isOk"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Business Logic Layer"
  ]
  node [
    id 584
    label "org.springframework.samples.petclinic.vets.web.VetResource.showResourcesVetList"
    function "showResourcesVetList"
    intent "show"
    domain_entity "resources"
    named_entities "list,resources,vet"
    business_role "API Layer"
  ]
  node [
    id 585
    label "this.getId"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "d,i"
    business_role "Domain Logic"
  ]
  node [
    id 586
    label "Files.walk"
    function "walk"
    intent "walk"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 587
    label "RequestPredicates.GET"
    function "GET"
    intent "get"
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 588
    label "vetRepository.findAll"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities ""
    business_role "Data Access Layer"
  ]
  node [
    id 589
    label "org.springframework.samples.petclinic.visits.web.VisitResource"
    function "VisitResource"
    intent "visit"
    domain_entity "resource"
    named_entities "resource"
    business_role "API Layer"
  ]
  node [
    id 590
    label "org.springframework.samples.petclinic.visits.model.Visit.setDescription"
    function "setDescription"
    intent "set"
    domain_entity "description"
    named_entities "description"
    business_role "Domain Model"
  ]
  node [
    id 591
    label "call.getScope().map(s -> s.toString() + '.' + call.getNameAsString()).orElse"
    function "orElse"
    intent ""
    domain_entity ""
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 592
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest"
    function "VetResourceTest"
    intent ""
    domain_entity "vet"
    named_entities "resource,test,vet"
    business_role "API Layer"
  ]
  node [
    id 593
    label "org.springframework.samples.petclinic.customers.web.OwnerResource.findOwner"
    function "findOwner"
    intent "find"
    domain_entity "owner"
    named_entities "owner"
    business_role "API Layer"
  ]
  node [
    id 594
    label "call.getScope().map"
    function "map"
    intent ""
    domain_entity "map"
    named_entities ""
    business_role "Domain Logic"
  ]
  node [
    id 595
    label "org.springframework.samples.petclinic.vets.model.Vet.addSpecialty"
    function "addSpecialty"
    intent "add"
    domain_entity "specialty"
    named_entities "specialty"
    business_role "Domain Model"
  ]
  node [
    id 596
    label "visitRepository.save"
    function "save"
    intent "save"
    domain_entity ""
    named_entities ""
    business_role "Data Access Layer"
  ]
  edge [
    source 3
    target 516
  ]
  edge [
    source 6
    target 469
  ]
  edge [
    source 7
    target 480
  ]
  edge [
    source 7
    target 48
  ]
  edge [
    source 7
    target 596
  ]
  edge [
    source 9
    target 238
  ]
  edge [
    source 9
    target 308
  ]
  edge [
    source 9
    target 57
  ]
  edge [
    source 9
    target 79
  ]
  edge [
    source 10
    target 557
  ]
  edge [
    source 19
    target 109
  ]
  edge [
    source 19
    target 305
  ]
  edge [
    source 19
    target 247
  ]
  edge [
    source 19
    target 513
  ]
  edge [
    source 19
    target 569
  ]
  edge [
    source 19
    target 113
  ]
  edge [
    source 19
    target 183
  ]
  edge [
    source 19
    target 14
  ]
  edge [
    source 22
    target 185
  ]
  edge [
    source 22
    target 435
  ]
  edge [
    source 26
    target 455
  ]
  edge [
    source 26
    target 520
  ]
  edge [
    source 26
    target 0
  ]
  edge [
    source 26
    target 292
  ]
  edge [
    source 26
    target 60
  ]
  edge [
    source 26
    target 21
  ]
  edge [
    source 26
    target 161
  ]
  edge [
    source 26
    target 448
  ]
  edge [
    source 26
    target 470
  ]
  edge [
    source 26
    target 546
  ]
  edge [
    source 29
    target 415
  ]
  edge [
    source 29
    target 343
  ]
  edge [
    source 29
    target 155
  ]
  edge [
    source 29
    target 409
  ]
  edge [
    source 29
    target 529
  ]
  edge [
    source 29
    target 77
  ]
  edge [
    source 32
    target 129
  ]
  edge [
    source 32
    target 558
  ]
  edge [
    source 32
    target 288
  ]
  edge [
    source 34
    target 442
  ]
  edge [
    source 34
    target 1
  ]
  edge [
    source 34
    target 75
  ]
  edge [
    source 34
    target 219
  ]
  edge [
    source 34
    target 44
  ]
  edge [
    source 34
    target 118
  ]
  edge [
    source 34
    target 119
  ]
  edge [
    source 34
    target 463
  ]
  edge [
    source 34
    target 464
  ]
  edge [
    source 34
    target 541
  ]
  edge [
    source 34
    target 226
  ]
  edge [
    source 34
    target 15
  ]
  edge [
    source 34
    target 201
  ]
  edge [
    source 34
    target 92
  ]
  edge [
    source 34
    target 574
  ]
  edge [
    source 34
    target 346
  ]
  edge [
    source 34
    target 58
  ]
  edge [
    source 34
    target 349
  ]
  edge [
    source 34
    target 61
  ]
  edge [
    source 34
    target 428
  ]
  edge [
    source 34
    target 316
  ]
  edge [
    source 34
    target 583
  ]
  edge [
    source 34
    target 318
  ]
  edge [
    source 34
    target 319
  ]
  edge [
    source 34
    target 284
  ]
  edge [
    source 34
    target 184
  ]
  edge [
    source 34
    target 400
  ]
  edge [
    source 38
    target 463
  ]
  edge [
    source 38
    target 400
  ]
  edge [
    source 39
    target 96
  ]
  edge [
    source 50
    target 296
  ]
  edge [
    source 59
    target 81
  ]
  edge [
    source 59
    target 280
  ]
  edge [
    source 59
    target 262
  ]
  edge [
    source 59
    target 68
  ]
  edge [
    source 59
    target 101
  ]
  edge [
    source 59
    target 350
  ]
  edge [
    source 59
    target 264
  ]
  edge [
    source 59
    target 450
  ]
  edge [
    source 59
    target 225
  ]
  edge [
    source 59
    target 535
  ]
  edge [
    source 103
    target 391
  ]
  edge [
    source 103
    target 444
  ]
  edge [
    source 103
    target 283
  ]
  edge [
    source 125
    target 246
  ]
  edge [
    source 125
    target 441
  ]
  edge [
    source 125
    target 525
  ]
  edge [
    source 125
    target 493
  ]
  edge [
    source 125
    target 549
  ]
  edge [
    source 125
    target 168
  ]
  edge [
    source 125
    target 328
  ]
  edge [
    source 125
    target 364
  ]
  edge [
    source 125
    target 497
  ]
  edge [
    source 125
    target 564
  ]
  edge [
    source 125
    target 449
  ]
  edge [
    source 125
    target 429
  ]
  edge [
    source 125
    target 413
  ]
  edge [
    source 125
    target 103
  ]
  edge [
    source 125
    target 65
  ]
  edge [
    source 125
    target 160
  ]
  edge [
    source 125
    target 484
  ]
  edge [
    source 125
    target 71
  ]
  edge [
    source 125
    target 401
  ]
  edge [
    source 126
    target 305
  ]
  edge [
    source 126
    target 223
  ]
  edge [
    source 126
    target 177
  ]
  edge [
    source 126
    target 113
  ]
  edge [
    source 126
    target 542
  ]
  edge [
    source 126
    target 227
  ]
  edge [
    source 133
    target 279
  ]
  edge [
    source 137
    target 73
  ]
  edge [
    source 137
    target 4
  ]
  edge [
    source 137
    target 151
  ]
  edge [
    source 137
    target 451
  ]
  edge [
    source 137
    target 370
  ]
  edge [
    source 137
    target 84
  ]
  edge [
    source 137
    target 87
  ]
  edge [
    source 137
    target 12
  ]
  edge [
    source 137
    target 89
  ]
  edge [
    source 137
    target 13
  ]
  edge [
    source 137
    target 228
  ]
  edge [
    source 137
    target 547
  ]
  edge [
    source 137
    target 229
  ]
  edge [
    source 137
    target 94
  ]
  edge [
    source 137
    target 102
  ]
  edge [
    source 137
    target 171
  ]
  edge [
    source 137
    target 233
  ]
  edge [
    source 137
    target 235
  ]
  edge [
    source 137
    target 106
  ]
  edge [
    source 137
    target 389
  ]
  edge [
    source 137
    target 240
  ]
  edge [
    source 137
    target 178
  ]
  edge [
    source 137
    target 395
  ]
  edge [
    source 137
    target 487
  ]
  edge [
    source 137
    target 494
  ]
  edge [
    source 137
    target 193
  ]
  edge [
    source 137
    target 248
  ]
  edge [
    source 137
    target 250
  ]
  edge [
    source 137
    target 496
  ]
  edge [
    source 137
    target 253
  ]
  edge [
    source 137
    target 499
  ]
  edge [
    source 137
    target 42
  ]
  edge [
    source 137
    target 414
  ]
  edge [
    source 137
    target 259
  ]
  edge [
    source 137
    target 335
  ]
  edge [
    source 137
    target 263
  ]
  edge [
    source 137
    target 338
  ]
  edge [
    source 137
    target 122
  ]
  edge [
    source 137
    target 265
  ]
  edge [
    source 137
    target 418
  ]
  edge [
    source 137
    target 341
  ]
  edge [
    source 137
    target 511
  ]
  edge [
    source 137
    target 576
  ]
  edge [
    source 137
    target 271
  ]
  edge [
    source 137
    target 130
  ]
  edge [
    source 137
    target 348
  ]
  edge [
    source 137
    target 424
  ]
  edge [
    source 137
    target 431
  ]
  edge [
    source 137
    target 277
  ]
  edge [
    source 137
    target 281
  ]
  edge [
    source 137
    target 211
  ]
  edge [
    source 137
    target 591
  ]
  edge [
    source 137
    target 594
  ]
  edge [
    source 137
    target 72
  ]
  edge [
    source 140
    target 257
  ]
  edge [
    source 140
    target 139
  ]
  edge [
    source 140
    target 261
  ]
  edge [
    source 140
    target 27
  ]
  edge [
    source 140
    target 191
  ]
  edge [
    source 140
    target 48
  ]
  edge [
    source 140
    target 273
  ]
  edge [
    source 140
    target 33
  ]
  edge [
    source 140
    target 80
  ]
  edge [
    source 140
    target 519
  ]
  edge [
    source 152
    target 279
  ]
  edge [
    source 163
    target 46
  ]
  edge [
    source 163
    target 437
  ]
  edge [
    source 173
    target 140
  ]
  edge [
    source 173
    target 40
  ]
  edge [
    source 173
    target 469
  ]
  edge [
    source 175
    target 188
  ]
  edge [
    source 175
    target 192
  ]
  edge [
    source 175
    target 410
  ]
  edge [
    source 175
    target 411
  ]
  edge [
    source 175
    target 500
  ]
  edge [
    source 175
    target 454
  ]
  edge [
    source 175
    target 117
  ]
  edge [
    source 175
    target 260
  ]
  edge [
    source 175
    target 505
  ]
  edge [
    source 175
    target 462
  ]
  edge [
    source 175
    target 337
  ]
  edge [
    source 175
    target 567
  ]
  edge [
    source 175
    target 199
  ]
  edge [
    source 175
    target 53
  ]
  edge [
    source 175
    target 55
  ]
  edge [
    source 175
    target 90
  ]
  edge [
    source 175
    target 56
  ]
  edge [
    source 175
    target 17
  ]
  edge [
    source 175
    target 342
  ]
  edge [
    source 175
    target 311
  ]
  edge [
    source 175
    target 231
  ]
  edge [
    source 175
    target 62
  ]
  edge [
    source 175
    target 134
  ]
  edge [
    source 175
    target 174
  ]
  edge [
    source 175
    target 24
  ]
  edge [
    source 175
    target 141
  ]
  edge [
    source 175
    target 392
  ]
  edge [
    source 175
    target 108
  ]
  edge [
    source 175
    target 145
  ]
  edge [
    source 182
    target 538
  ]
  edge [
    source 182
    target 119
  ]
  edge [
    source 182
    target 251
  ]
  edge [
    source 182
    target 242
  ]
  edge [
    source 182
    target 517
  ]
  edge [
    source 182
    target 580
  ]
  edge [
    source 182
    target 15
  ]
  edge [
    source 186
    target 18
  ]
  edge [
    source 186
    target 287
  ]
  edge [
    source 186
    target 99
  ]
  edge [
    source 186
    target 172
  ]
  edge [
    source 186
    target 352
  ]
  edge [
    source 186
    target 518
  ]
  edge [
    source 186
    target 137
  ]
  edge [
    source 186
    target 9
  ]
  edge [
    source 186
    target 175
  ]
  edge [
    source 186
    target 461
  ]
  edge [
    source 186
    target 586
  ]
  edge [
    source 186
    target 282
  ]
  edge [
    source 186
    target 572
  ]
  edge [
    source 186
    target 438
  ]
  edge [
    source 186
    target 146
  ]
  edge [
    source 186
    target 303
  ]
  edge [
    source 187
    target 406
  ]
  edge [
    source 187
    target 378
  ]
  edge [
    source 187
    target 587
  ]
  edge [
    source 187
    target 51
  ]
  edge [
    source 187
    target 100
  ]
  edge [
    source 187
    target 323
  ]
  edge [
    source 206
    target 557
  ]
  edge [
    source 210
    target 279
  ]
  edge [
    source 213
    target 279
  ]
  edge [
    source 217
    target 503
  ]
  edge [
    source 217
    target 244
  ]
  edge [
    source 234
    target 45
  ]
  edge [
    source 234
    target 423
  ]
  edge [
    source 234
    target 412
  ]
  edge [
    source 237
    target 383
  ]
  edge [
    source 237
    target 385
  ]
  edge [
    source 237
    target 309
  ]
  edge [
    source 237
    target 585
  ]
  edge [
    source 237
    target 300
  ]
  edge [
    source 237
    target 339
  ]
  edge [
    source 237
    target 427
  ]
  edge [
    source 237
    target 114
  ]
  edge [
    source 237
    target 498
  ]
  edge [
    source 237
    target 274
  ]
  edge [
    source 241
    target 196
  ]
  edge [
    source 241
    target 37
  ]
  edge [
    source 241
    target 480
  ]
  edge [
    source 241
    target 377
  ]
  edge [
    source 242
    target 433
  ]
  edge [
    source 242
    target 504
  ]
  edge [
    source 242
    target 67
  ]
  edge [
    source 242
    target 350
  ]
  edge [
    source 242
    target 571
  ]
  edge [
    source 242
    target 135
  ]
  edge [
    source 242
    target 489
  ]
  edge [
    source 251
    target 556
  ]
  edge [
    source 251
    target 359
  ]
  edge [
    source 266
    target 326
  ]
  edge [
    source 266
    target 111
  ]
  edge [
    source 266
    target 119
  ]
  edge [
    source 266
    target 38
  ]
  edge [
    source 266
    target 158
  ]
  edge [
    source 266
    target 30
  ]
  edge [
    source 266
    target 299
  ]
  edge [
    source 266
    target 59
  ]
  edge [
    source 266
    target 445
  ]
  edge [
    source 266
    target 184
  ]
  edge [
    source 267
    target 149
  ]
  edge [
    source 278
    target 127
  ]
  edge [
    source 278
    target 190
  ]
  edge [
    source 285
    target 140
  ]
  edge [
    source 285
    target 272
  ]
  edge [
    source 285
    target 294
  ]
  edge [
    source 285
    target 368
  ]
  edge [
    source 286
    target 566
  ]
  edge [
    source 286
    target 553
  ]
  edge [
    source 286
    target 93
  ]
  edge [
    source 286
    target 334
  ]
  edge [
    source 286
    target 548
  ]
  edge [
    source 286
    target 373
  ]
  edge [
    source 286
    target 245
  ]
  edge [
    source 286
    target 565
  ]
  edge [
    source 286
    target 78
  ]
  edge [
    source 307
    target 185
  ]
  edge [
    source 307
    target 435
  ]
  edge [
    source 314
    target 415
  ]
  edge [
    source 314
    target 155
  ]
  edge [
    source 314
    target 198
  ]
  edge [
    source 314
    target 121
  ]
  edge [
    source 314
    target 529
  ]
  edge [
    source 322
    target 509
  ]
  edge [
    source 322
    target 304
  ]
  edge [
    source 322
    target 166
  ]
  edge [
    source 322
    target 128
  ]
  edge [
    source 322
    target 290
  ]
  edge [
    source 322
    target 170
  ]
  edge [
    source 322
    target 209
  ]
  edge [
    source 322
    target 64
  ]
  edge [
    source 322
    target 388
  ]
  edge [
    source 322
    target 49
  ]
  edge [
    source 322
    target 588
  ]
  edge [
    source 322
    target 54
  ]
  edge [
    source 322
    target 436
  ]
  edge [
    source 322
    target 301
  ]
  edge [
    source 331
    target 279
  ]
  edge [
    source 332
    target 456
  ]
  edge [
    source 332
    target 526
  ]
  edge [
    source 333
    target 139
  ]
  edge [
    source 333
    target 82
  ]
  edge [
    source 333
    target 0
  ]
  edge [
    source 333
    target 272
  ]
  edge [
    source 333
    target 470
  ]
  edge [
    source 333
    target 33
  ]
  edge [
    source 333
    target 490
  ]
  edge [
    source 380
    target 304
  ]
  edge [
    source 380
    target 214
  ]
  edge [
    source 380
    target 440
  ]
  edge [
    source 380
    target 405
  ]
  edge [
    source 380
    target 167
  ]
  edge [
    source 380
    target 347
  ]
  edge [
    source 380
    target 443
  ]
  edge [
    source 380
    target 148
  ]
  edge [
    source 380
    target 310
  ]
  edge [
    source 380
    target 150
  ]
  edge [
    source 380
    target 98
  ]
  edge [
    source 380
    target 453
  ]
  edge [
    source 380
    target 333
  ]
  edge [
    source 380
    target 222
  ]
  edge [
    source 380
    target 179
  ]
  edge [
    source 380
    target 159
  ]
  edge [
    source 380
    target 375
  ]
  edge [
    source 380
    target 88
  ]
  edge [
    source 380
    target 436
  ]
  edge [
    source 380
    target 486
  ]
  edge [
    source 380
    target 124
  ]
  edge [
    source 384
    target 526
  ]
  edge [
    source 384
    target 45
  ]
  edge [
    source 384
    target 412
  ]
  edge [
    source 387
    target 2
  ]
  edge [
    source 399
    target 324
  ]
  edge [
    source 399
    target 325
  ]
  edge [
    source 399
    target 407
  ]
  edge [
    source 399
    target 327
  ]
  edge [
    source 399
    target 528
  ]
  edge [
    source 399
    target 446
  ]
  edge [
    source 399
    target 153
  ]
  edge [
    source 399
    target 295
  ]
  edge [
    source 399
    target 115
  ]
  edge [
    source 399
    target 536
  ]
  edge [
    source 399
    target 416
  ]
  edge [
    source 399
    target 156
  ]
  edge [
    source 399
    target 11
  ]
  edge [
    source 399
    target 465
  ]
  edge [
    source 399
    target 200
  ]
  edge [
    source 399
    target 304
  ]
  edge [
    source 399
    target 510
  ]
  edge [
    source 399
    target 421
  ]
  edge [
    source 399
    target 471
  ]
  edge [
    source 399
    target 207
  ]
  edge [
    source 399
    target 550
  ]
  edge [
    source 399
    target 276
  ]
  edge [
    source 399
    target 104
  ]
  edge [
    source 399
    target 582
  ]
  edge [
    source 399
    target 434
  ]
  edge [
    source 399
    target 180
  ]
  edge [
    source 399
    target 396
  ]
  edge [
    source 399
    target 436
  ]
  edge [
    source 399
    target 244
  ]
  edge [
    source 399
    target 524
  ]
  edge [
    source 409
    target 164
  ]
  edge [
    source 409
    target 270
  ]
  edge [
    source 409
    target 218
  ]
  edge [
    source 409
    target 157
  ]
  edge [
    source 409
    target 5
  ]
  edge [
    source 420
    target 279
  ]
  edge [
    source 422
    target 275
  ]
  edge [
    source 425
    target 279
  ]
  edge [
    source 426
    target 279
  ]
  edge [
    source 439
    target 315
  ]
  edge [
    source 439
    target 344
  ]
  edge [
    source 439
    target 423
  ]
  edge [
    source 447
    target 116
  ]
  edge [
    source 447
    target 557
  ]
  edge [
    source 447
    target 212
  ]
  edge [
    source 447
    target 507
  ]
  edge [
    source 458
    target 514
  ]
  edge [
    source 461
    target 342
  ]
  edge [
    source 461
    target 512
  ]
  edge [
    source 461
    target 188
  ]
  edge [
    source 461
    target 360
  ]
  edge [
    source 461
    target 192
  ]
  edge [
    source 461
    target 362
  ]
  edge [
    source 461
    target 410
  ]
  edge [
    source 461
    target 231
  ]
  edge [
    source 461
    target 411
  ]
  edge [
    source 461
    target 313
  ]
  edge [
    source 461
    target 552
  ]
  edge [
    source 461
    target 79
  ]
  edge [
    source 461
    target 138
  ]
  edge [
    source 461
    target 238
  ]
  edge [
    source 461
    target 505
  ]
  edge [
    source 461
    target 141
  ]
  edge [
    source 461
    target 392
  ]
  edge [
    source 461
    target 85
  ]
  edge [
    source 461
    target 53
  ]
  edge [
    source 461
    target 55
  ]
  edge [
    source 461
    target 145
  ]
  edge [
    source 469
    target 222
  ]
  edge [
    source 469
    target 142
  ]
  edge [
    source 474
    target 16
  ]
  edge [
    source 474
    target 74
  ]
  edge [
    source 474
    target 309
  ]
  edge [
    source 474
    target 329
  ]
  edge [
    source 474
    target 330
  ]
  edge [
    source 474
    target 274
  ]
  edge [
    source 474
    target 534
  ]
  edge [
    source 474
    target 476
  ]
  edge [
    source 474
    target 255
  ]
  edge [
    source 474
    target 459
  ]
  edge [
    source 474
    target 320
  ]
  edge [
    source 474
    target 585
  ]
  edge [
    source 474
    target 393
  ]
  edge [
    source 474
    target 483
  ]
  edge [
    source 474
    target 269
  ]
  edge [
    source 478
    target 357
  ]
  edge [
    source 479
    target 215
  ]
  edge [
    source 479
    target 36
  ]
  edge [
    source 479
    target 575
  ]
  edge [
    source 479
    target 577
  ]
  edge [
    source 479
    target 539
  ]
  edge [
    source 479
    target 83
  ]
  edge [
    source 479
    target 522
  ]
  edge [
    source 479
    target 444
  ]
  edge [
    source 479
    target 363
  ]
  edge [
    source 479
    target 86
  ]
  edge [
    source 479
    target 560
  ]
  edge [
    source 479
    target 220
  ]
  edge [
    source 491
    target 48
  ]
  edge [
    source 491
    target 291
  ]
  edge [
    source 491
    target 467
  ]
  edge [
    source 491
    target 294
  ]
  edge [
    source 491
    target 368
  ]
  edge [
    source 532
    target 196
  ]
  edge [
    source 532
    target 37
  ]
  edge [
    source 532
    target 480
  ]
  edge [
    source 532
    target 377
  ]
  edge [
    source 533
    target 298
  ]
  edge [
    source 559
    target 403
  ]
  edge [
    source 559
    target 204
  ]
  edge [
    source 559
    target 345
  ]
  edge [
    source 559
    target 46
  ]
  edge [
    source 559
    target 120
  ]
  edge [
    source 559
    target 353
  ]
  edge [
    source 570
    target 493
  ]
  edge [
    source 570
    target 168
  ]
  edge [
    source 570
    target 351
  ]
  edge [
    source 570
    target 477
  ]
  edge [
    source 570
    target 91
  ]
  edge [
    source 573
    target 291
  ]
  edge [
    source 573
    target 467
  ]
  edge [
    source 578
    target 442
  ]
  edge [
    source 578
    target 1
  ]
  edge [
    source 578
    target 75
  ]
  edge [
    source 578
    target 249
  ]
  edge [
    source 578
    target 219
  ]
  edge [
    source 578
    target 44
  ]
  edge [
    source 578
    target 118
  ]
  edge [
    source 578
    target 119
  ]
  edge [
    source 578
    target 463
  ]
  edge [
    source 578
    target 464
  ]
  edge [
    source 578
    target 541
  ]
  edge [
    source 578
    target 226
  ]
  edge [
    source 578
    target 15
  ]
  edge [
    source 578
    target 201
  ]
  edge [
    source 578
    target 92
  ]
  edge [
    source 578
    target 574
  ]
  edge [
    source 578
    target 346
  ]
  edge [
    source 578
    target 58
  ]
  edge [
    source 578
    target 379
  ]
  edge [
    source 578
    target 61
  ]
  edge [
    source 578
    target 428
  ]
  edge [
    source 578
    target 316
  ]
  edge [
    source 578
    target 583
  ]
  edge [
    source 578
    target 318
  ]
  edge [
    source 578
    target 319
  ]
  edge [
    source 578
    target 284
  ]
  edge [
    source 578
    target 184
  ]
  edge [
    source 578
    target 400
  ]
  edge [
    source 584
    target 588
  ]
  edge [
    source 593
    target 294
  ]
  edge [
    source 595
    target 526
  ]
  edge [
    source 595
    target 408
  ]
]
