graph [
  directed 1
  node [
    id 0
    label "owner.setFirstName"
    node_type "function"
    function "setFirstName"
    intent "set"
    domain_entity "first"
    named_entities "[&#34;first&#34;, &#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 1
    label "PetDetails.PetDetailsBuilder.aPetDetails().id(20).name('Garfield').visits"
    node_type "function"
    function "visits"
    intent ""
    domain_entity "visit"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 2
    label "petclinicAiProvider.addPetToOwner"
    node_type "function"
    function "addPetToOwner"
    intent "add"
    domain_entity "pet"
    named_entities "[&#34;owner&#34;, &#34;pet&#34;, &#34;to&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 3
    label "org.springframework.samples.petclinic.genai.AIFunctionConfiguration.listOwners"
    node_type "function"
    function "listOwners"
    intent ""
    domain_entity "list"
    named_entities "[&#34;list&#34;, &#34;owner&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 4
    label "method.getParameters().stream().map"
    node_type "function"
    function "map"
    intent ""
    domain_entity "map"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 5
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClient.joining"
    node_type "function"
    function "joining"
    intent "join"
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 6
    label "org.springframework.samples.petclinic.customers.web.PetResource.findPet"
    node_type "function"
    function "findPet"
    intent "find"
    domain_entity "pet"
    named_entities "[&#34;pet&#34;]"
    business_role "API Layer"
  ]
  node [
    id 7
    label "org.springframework.samples.petclinic.visits.web.VisitResource.create"
    node_type "function"
    function "create"
    intent "create"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 8
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor"
    node_type "function"
    function "RepoWideExtractor"
    intent ""
    domain_entity "repo"
    named_entities "[&#34;extractor&#34;, &#34;repo&#34;, &#34;wide&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 9
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor.exportSemanticJSON"
    node_type "function"
    function "exportSemanticJSON"
    intent "export"
    domain_entity "json"
    named_entities "[&#34;json&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 10
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication.loadBalancedWebClientBuilder"
    node_type "function"
    function "loadBalancedWebClientBuilder"
    intent "load"
    domain_entity "balanced"
    named_entities "[&#34;balanced&#34;, &#34;builder&#34;, &#34;client&#34;, &#34;web&#34;]"
    business_role "API Layer"
  ]
  node [
    id 11
    label "Visit.VisitBuilder.aVisit().id(2).petId"
    node_type "function"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 12
    label "c.getScope"
    node_type "function"
    function "getScope"
    intent "get"
    domain_entity "scope"
    named_entities "[&#34;scope&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 13
    label "e.getMessage"
    node_type "function"
    function "getMessage"
    intent "get"
    domain_entity "message"
    named_entities "[&#34;message&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 14
    label "webClient.post().uri(ownersHostname + 'owners/' + request.ownerId() + '/pets').bodyValue"
    node_type "function"
    function "bodyValue"
    intent ""
    domain_entity "body"
    named_entities "[&#34;body&#34;, &#34;value&#34;]"
    business_role "API Layer"
  ]
  node [
    id 15
    label "Collections.singletonList"
    node_type "function"
    function "singletonList"
    intent ""
    domain_entity "singleton"
    named_entities "[&#34;list&#34;, &#34;singleton&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 16
    label "this.getType"
    node_type "function"
    function "getType"
    intent "get"
    domain_entity "type"
    named_entities "[&#34;type&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 17
    label "graph.appendChild"
    node_type "function"
    function "appendChild"
    intent "append"
    domain_entity "child"
    named_entities "[&#34;child&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 18
    label "javaFiles.size"
    node_type "function"
    function "size"
    intent ""
    domain_entity "size"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 19
    label "org.springframework.samples.petclinic.genai.AIDataProvider.addPetToOwner"
    node_type "function"
    function "addPetToOwner"
    intent "add"
    domain_entity "pet"
    named_entities "[&#34;owner&#34;, &#34;pet&#34;, &#34;to&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 20
    label "org.springframework.samples.petclinic.visits.model.Visit.setPetId"
    node_type "function"
    function "setPetId"
    intent "set"
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 21
    label "owner.setTelephone"
    node_type "function"
    function "setTelephone"
    intent "set"
    domain_entity "telephone"
    named_entities "[&#34;telephone&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 22
    label "org.springframework.samples.petclinic.visits.config.MetricConfig.metricsCommonTags"
    node_type "function"
    function "metricsCommonTags"
    intent ""
    domain_entity "metric"
    named_entities "[&#34;common&#34;, &#34;metric&#34;, &#34;tags&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 23
    label "org.springframework.samples.petclinic.vets.model.Vet.getId"
    node_type "function"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 24
    label "graph.setAttribute"
    node_type "function"
    function "setAttribute"
    intent "set"
    domain_entity "attribute"
    named_entities "[&#34;attribute&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 25
    label "org.springframework.samples.petclinic.visits.model.Visit.getPetId"
    node_type "function"
    function "getPetId"
    intent "get"
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 26
    label "org.springframework.samples.petclinic.customers.web.mapper.OwnerEntityMapper.map"
    node_type "function"
    function "map"
    intent ""
    domain_entity "map"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 27
    label "pet.setBirthDate"
    node_type "function"
    function "setBirthDate"
    intent "set"
    domain_entity "birth"
    named_entities "[&#34;birth&#34;, &#34;date&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 28
    label "org.springframework.samples.petclinic.admin.SpringBootAdminApplication"
    node_type "function"
    function "SpringBootAdminApplication"
    intent ""
    domain_entity "spring"
    named_entities "[&#34;admin&#34;, &#34;application&#34;, &#34;boot&#34;, &#34;spring&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 29
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClient.getVisitsForPets"
    node_type "function"
    function "getVisitsForPets"
    intent "get"
    domain_entity "visit"
    named_entities "[&#34;pet&#34;, &#34;visit&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 30
    label "owner.getPetIds"
    node_type "function"
    function "getPetIds"
    intent "get"
    domain_entity "pet"
    named_entities "[&#34;ids&#34;, &#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 31
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.name"
    node_type "function"
    function "name"
    intent ""
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 32
    label "org.springframework.samples.petclinic.customers.model.Pet.equals"
    node_type "function"
    function "equals"
    intent "equal"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Model"
  ]
  node [
    id 33
    label "pet.setType"
    node_type "function"
    function "setType"
    intent "set"
    domain_entity "type"
    named_entities "[&#34;type&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 34
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayControllerTest.getOwnerDetails_withAvailableVisitsService"
    node_type "function"
    function "getOwnerDetails_withAvailableVisitsService"
    intent "get"
    domain_entity "owner"
    named_entities "[&#34;available&#34;, &#34;details&#34;, &#34;owner&#34;, &#34;service&#34;, &#34;visits&#34;]"
    business_role "API Layer"
  ]
  node [
    id 35
    label "org.springframework.samples.petclinic.vets.VetsServiceApplication"
    node_type "function"
    function "VetsServiceApplication"
    intent ""
    domain_entity "vets"
    named_entities "[&#34;application&#34;, &#34;service&#34;, &#34;vets&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 36
    label "topMatches.stream().map"
    node_type "function"
    function "map"
    intent ""
    domain_entity "map"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 37
    label "visit.setId"
    node_type "function"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 38
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayController.emptyVisitsForPets"
    node_type "function"
    function "emptyVisitsForPets"
    intent ""
    domain_entity "visit"
    named_entities "[&#34;pet&#34;, &#34;visit&#34;]"
    business_role "API Layer"
  ]
  node [
    id 39
    label "org.springframework.samples.petclinic.api.boundary.web.CircuitBreakerConfiguration.circuitBreakerRegistry"
    node_type "function"
    function "circuitBreakerRegistry"
    intent ""
    domain_entity "circuit"
    named_entities "[&#34;breaker&#34;, &#34;circuit&#34;, &#34;registry&#34;]"
    business_role "API Layer"
  ]
  node [
    id 40
    label "petRequest.id"
    node_type "function"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "[&#34;d&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 41
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest"
    node_type "function"
    function "VisitsServiceClientIntegrationTest"
    intent ""
    domain_entity "visit"
    named_entities "[&#34;client&#34;, &#34;integration&#34;, &#34;service&#34;, &#34;test&#34;, &#34;visit&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 42
    label "imports.forEach"
    node_type "function"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 43
    label "org.springframework.samples.petclinic.customers.web.ResourceNotFoundException"
    node_type "function"
    function "ResourceNotFoundException"
    intent "find"
    domain_entity "resource"
    named_entities "[&#34;exception&#34;, &#34;resource&#34;]"
    business_role "API Layer"
  ]
  node [
    id 44
    label "cat.id"
    node_type "function"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "[&#34;d&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 45
    label "Collections.unmodifiableList"
    node_type "function"
    function "unmodifiableList"
    intent ""
    domain_entity "list"
    named_entities "[&#34;list&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 46
    label "LOG.error"
    node_type "function"
    function "error"
    intent ""
    domain_entity "error"
    named_entities "[&#34;error&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 47
    label "org.springframework.samples.petclinic.customers.model.Owner.setCity"
    node_type "function"
    function "setCity"
    intent "set"
    domain_entity "city"
    named_entities "[&#34;city&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 48
    label "log.info"
    node_type "function"
    function "info"
    intent ""
    domain_entity "info"
    named_entities "[&#34;info&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 49
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.given"
    node_type "function"
    function "given"
    intent "give"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 50
    label "org.springframework.samples.petclinic.genai.AIFunctionConfiguration.addOwnerToPetclinic"
    node_type "function"
    function "addOwnerToPetclinic"
    intent "add"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 51
    label "ServerResponse.ok().contentType"
    node_type "function"
    function "contentType"
    intent ""
    domain_entity "content"
    named_entities "[&#34;content&#34;, &#34;type&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 52
    label "org.springframework.samples.petclinic.visits.model.Visit.date"
    node_type "function"
    function "date"
    intent ""
    domain_entity "date"
    named_entities "[&#34;date&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 53
    label "callGraph.entrySet"
    node_type "function"
    function "entrySet"
    intent ""
    domain_entity "entry"
    named_entities "[&#34;entry&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 54
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.asList"
    node_type "function"
    function "asList"
    intent ""
    domain_entity "list"
    named_entities "[&#34;list&#34;]"
    business_role "API Layer"
  ]
  node [
    id 55
    label "ids.get"
    node_type "function"
    function "get"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 56
    label "factory.newDocumentBuilder"
    node_type "function"
    function "newDocumentBuilder"
    intent ""
    domain_entity "new"
    named_entities "[&#34;builder&#34;, &#34;document&#34;, &#34;new&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 57
    label "arr.toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 58
    label "client.get().uri"
    node_type "function"
    function "uri"
    intent ""
    domain_entity "uri"
    named_entities "[&#34;uri&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 59
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayController.addVisitsToOwner"
    node_type "function"
    function "addVisitsToOwner"
    intent "add"
    domain_entity "visit"
    named_entities "[&#34;owner&#34;, &#34;visit&#34;]"
    business_role "API Layer"
  ]
  node [
    id 60
    label "owner.setCity"
    node_type "function"
    function "setCity"
    intent "set"
    domain_entity "city"
    named_entities "[&#34;city&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 61
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody().jsonPath"
    node_type "function"
    function "jsonPath"
    intent ""
    domain_entity "json"
    named_entities "[&#34;json&#34;, &#34;path&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 62
    label "TransformerFactory.newInstance().newTransformer"
    node_type "function"
    function "newTransformer"
    intent ""
    domain_entity "new"
    named_entities "[&#34;new&#34;, &#34;transformer&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 63
    label "org.springframework.samples.petclinic.vets.model.Vet"
    node_type "function"
    function "Vet"
    intent ""
    domain_entity "vet"
    named_entities "[]"
    business_role "Domain Model"
  ]
  node [
    id 64
    label "mvc.perform(get('/vets').accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk()).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 65
    label "webClient.get().uri(vetsHostname + 'vets').retrieve().bodyToMono"
    node_type "function"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "[&#34;body&#34;, &#34;mono&#34;]"
    business_role "API Layer"
  ]
  node [
    id 66
    label "org.springframework.samples.petclinic.customers.model.Owner.getCity"
    node_type "function"
    function "getCity"
    intent "get"
    domain_entity "city"
    named_entities "[&#34;city&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 67
    label "visits.items().get(0).petId"
    node_type "function"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 68
    label "pet.visits().addAll"
    node_type "function"
    function "addAll"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 69
    label "org.springframework.samples.petclinic.genai.VectorStoreController"
    node_type "function"
    function "VectorStoreController"
    intent ""
    domain_entity "vector"
    named_entities "[&#34;controller&#34;, &#34;store&#34;, &#34;vector&#34;]"
    business_role "API Layer"
  ]
  node [
    id 70
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.anOwnerDetails"
    node_type "function"
    function "anOwnerDetails"
    intent ""
    domain_entity "owner"
    named_entities "[&#34;details&#34;, &#34;owner&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 71
    label "PosixFilePermissions.fromString"
    node_type "function"
    function "fromString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 72
    label "functionSemanticData.add"
    node_type "function"
    function "add"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 73
    label "cu.getPackageDeclaration"
    node_type "function"
    function "getPackageDeclaration"
    intent "get"
    domain_entity "package"
    named_entities "[&#34;declaration&#34;, &#34;package&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 74
    label "new ToStringCreator(this).append('id', this.getId()).append('name', this.getName()).append"
    node_type "function"
    function "append"
    intent ""
    domain_entity "append"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 75
    label "OwnerDetails.OwnerDetailsBuilder.anOwnerDetails().pets"
    node_type "function"
    function "pets"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 76
    label "org.springframework.samples.petclinic.vets.system.CacheConfig"
    node_type "function"
    function "CacheConfig"
    intent ""
    domain_entity "cache"
    named_entities "[&#34;cache&#34;, &#34;config&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 77
    label "webClientBuilder.build().get().uri(hostname + 'pets/visits?petId={petId}', joinIds(petIds)).retrieve().bodyToMono"
    node_type "function"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "[&#34;body&#34;, &#34;mono&#34;]"
    business_role "API Layer"
  ]
  node [
    id 78
    label "new Resilience4JConfigBuilder(id).circuitBreakerConfig(CircuitBreakerConfig.ofDefaults()).timeLimiterConfig(TimeLimiterConfig.custom().timeoutDuration(Duration.ofSeconds(10)).build()).build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Configuration Layer"
  ]
  node [
    id 79
    label "writer.write"
    node_type "function"
    function "write"
    intent "write"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 80
    label "petRequest.birthDate"
    node_type "function"
    function "birthDate"
    intent ""
    domain_entity "birth"
    named_entities "[&#34;birth&#34;, &#34;date&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 81
    label "owner.pets().forEach"
    node_type "function"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 82
    label "pet.setId"
    node_type "function"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 83
    label "this.vectorStore.similaritySearch"
    node_type "function"
    function "similaritySearch"
    intent ""
    domain_entity "similarity"
    named_entities "[&#34;search&#34;, &#34;similarity&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 84
    label "c.getNameAsString"
    node_type "function"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;, &#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 85
    label "node.replace('\'', ''').replace('\n', ' ').replace('\r', ' ').replace"
    node_type "function"
    function "replace"
    intent "replace"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 86
    label "SearchRequest.from"
    node_type "function"
    function "from"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 87
    label "c.getScope().map(s -> s.toString() + '.' + c.getNameAsString()).orElse"
    node_type "function"
    function "orElse"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 88
    label "given(petRepository.findById(2)).willReturn"
    node_type "function"
    function "willReturn"
    intent "return"
    domain_entity ""
    named_entities "[]"
    business_role "Data Access Layer"
  ]
  node [
    id 89
    label "System.err.println"
    node_type "function"
    function "println"
    intent ""
    domain_entity "println"
    named_entities "[&#34;println&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 90
    label "n.appendChild"
    node_type "function"
    function "appendChild"
    intent "append"
    domain_entity "child"
    named_entities "[&#34;child&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 91
    label "webClient.get().uri(ownersHostname + 'owners').retrieve().bodyToMono(new ParameterizedTypeReference<List<OwnerDetails>>() {  }).block"
    node_type "function"
    function "block"
    intent ""
    domain_entity "block"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 92
    label "PetDetails.PetDetailsBuilder.aPetDetails().id(20).name"
    node_type "function"
    function "name"
    intent ""
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 93
    label "TimeLimiterConfig.custom"
    node_type "function"
    function "custom"
    intent ""
    domain_entity "custom"
    named_entities "[&#34;custom&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 94
    label "StaticJavaParser.parse"
    node_type "function"
    function "parse"
    intent "parse"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 95
    label "org.springframework.samples.petclinic.customers.web.PetResource"
    node_type "function"
    function "PetResource"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;pet&#34;, &#34;resource&#34;]"
    business_role "API Layer"
  ]
  node [
    id 96
    label "CircuitBreakerRegistry.ofDefaults"
    node_type "function"
    function "ofDefaults"
    intent ""
    domain_entity "default"
    named_entities "[&#34;default&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 97
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest"
    node_type "function"
    function "PetResourceTest"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;pet&#34;, &#34;resource&#34;, &#34;test&#34;]"
    business_role "API Layer"
  ]
  node [
    id 98
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.get"
    node_type "function"
    function "get"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 99
    label "p.toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 100
    label "RouterFunctions.resources"
    node_type "function"
    function "resources"
    intent ""
    domain_entity "resource"
    named_entities "[&#34;resource&#34;]"
    business_role "API Layer"
  ]
  node [
    id 101
    label "pet.id"
    node_type "function"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "[&#34;d&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 102
    label "imports.add"
    node_type "function"
    function "add"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 103
    label "org.springframework.samples.petclinic.genai.VectorStoreController.convertListToJsonResource"
    node_type "function"
    function "convertListToJsonResource"
    intent "convert"
    domain_entity "list"
    named_entities "[&#34;json&#34;, &#34;list&#34;, &#34;resource&#34;]"
    business_role "API Layer"
  ]
  node [
    id 104
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 105
    label "org.springframework.samples.petclinic.discovery.DiscoveryServerApplication"
    node_type "function"
    function "DiscoveryServerApplication"
    intent ""
    domain_entity "discovery"
    named_entities "[&#34;application&#34;, &#34;discovery&#34;, &#34;server&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 106
    label "method.getType"
    node_type "function"
    function "getType"
    intent "get"
    domain_entity "type"
    named_entities "[&#34;type&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 107
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.aVisit"
    node_type "function"
    function "aVisit"
    intent ""
    domain_entity "visit"
    named_entities "[&#34;visit&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 108
    label "n.setAttribute"
    node_type "function"
    function "setAttribute"
    intent "set"
    domain_entity "attribute"
    named_entities "[&#34;attribute&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 109
    label "request.ownerId"
    node_type "function"
    function "ownerId"
    intent ""
    domain_entity "owner"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;owner&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 110
    label "org.springframework.samples.petclinic.customers.config.MetricConfig.timedAspect"
    node_type "function"
    function "timedAspect"
    intent "time"
    domain_entity "aspect"
    named_entities "[&#34;aspect&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 111
    label "visitsServiceClient.getVisitsForPets(owner.getPetIds()).transform"
    node_type "function"
    function "transform"
    intent "transform"
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 112
    label "org.springframework.samples.petclinic.vets.model.Specialty.setName"
    node_type "function"
    function "setName"
    intent "set"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 113
    label "webClient.post"
    node_type "function"
    function "post"
    intent "post"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 114
    label "new ToStringCreator(this).append('id', this.getId()).append('lastName', this.getLastName()).append('firstName', this.getFirstName()).append('address', this.address).append"
    node_type "function"
    function "append"
    intent ""
    domain_entity "append"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 115
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect(jsonPath('$.items(0).id').value(1)).andExpect(jsonPath('$.items(1).id').value(2)).andExpect(jsonPath('$.items(2).id').value(3)).andExpect(jsonPath('$.items(0).petId').value(111)).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 116
    label "visitsServiceClient.setHostname"
    node_type "function"
    function "setHostname"
    intent "set"
    domain_entity "hostname"
    named_entities "[&#34;hostname&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 117
    label "builder.newDocument"
    node_type "function"
    function "newDocument"
    intent ""
    domain_entity "new"
    named_entities "[&#34;document&#34;, &#34;new&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 118
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus"
    node_type "function"
    function "expectStatus"
    intent "expect"
    domain_entity "status"
    named_entities "[&#34;status&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 119
    label "visitsServiceClient.getVisitsForPets"
    node_type "function"
    function "getVisitsForPets"
    intent "get"
    domain_entity "visit"
    named_entities "[&#34;pet&#34;, &#34;visit&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 120
    label "this.chatClient.prompt().user(u -> u.text(query)).call"
    node_type "function"
    function "call"
    intent "call"
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 121
    label "webClientBuilder.build().get().uri('http://customers-service/owners/{ownerId}', ownerId).retrieve"
    node_type "function"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 122
    label "fn.put"
    node_type "function"
    function "put"
    intent "put"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 123
    label "org.springframework.samples.petclinic.visits.model.Visit.getId"
    node_type "function"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 124
    label "mvc.perform(get('/owners/2/pets/2').accept(MediaType.APPLICATION_JSON)).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 125
    label "org.springframework.samples.petclinic.genai.VectorStoreController.loadVetDataToVectorStoreOnStartup"
    node_type "function"
    function "loadVetDataToVectorStoreOnStartup"
    intent ""
    domain_entity "load"
    named_entities "[&#34;data&#34;, &#34;load&#34;, &#34;startup&#34;, &#34;store&#34;, &#34;vector&#34;, &#34;vet&#34;]"
    business_role "API Layer"
  ]
  node [
    id 126
    label "org.springframework.samples.petclinic.genai.AIDataProvider.addOwnerToPetclinic"
    node_type "function"
    function "addOwnerToPetclinic"
    intent "add"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 127
    label "ResponseEntity.status"
    node_type "function"
    function "status"
    intent ""
    domain_entity "status"
    named_entities "[&#34;status&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 128
    label "mvc.perform(get('/vets').accept(MediaType.APPLICATION_JSON)).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 129
    label "Objects.equals"
    node_type "function"
    function "equals"
    intent "equal"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 130
    label "cu.findAll"
    node_type "function"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 131
    label "org.springframework.samples.petclinic.customers.CustomersServiceApplication"
    node_type "function"
    function "CustomersServiceApplication"
    intent ""
    domain_entity "customers"
    named_entities "[&#34;application&#34;, &#34;customer&#34;, &#34;service&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 132
    label "org.springframework.samples.petclinic.customers.config.MetricConfig"
    node_type "function"
    function "MetricConfig"
    intent ""
    domain_entity "metric"
    named_entities "[&#34;config&#34;, &#34;metric&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 133
    label "org.springframework.samples.petclinic.customers.CustomersServiceApplication.main"
    node_type "function"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 134
    label "data.setTextContent"
    node_type "function"
    function "setTextContent"
    intent "set"
    domain_entity "text"
    named_entities "[&#34;content&#34;, &#34;text&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 135
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.assertEquals"
    node_type "function"
    function "assertEquals"
    intent "assert"
    domain_entity "equals"
    named_entities "[&#34;equals&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 136
    label "org.springframework.samples.petclinic.config.PetclinicConfigServerApplicationTests.contextLoads"
    node_type "function"
    function "contextLoads"
    intent ""
    domain_entity "context"
    named_entities "[&#34;context&#34;, &#34;load&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 137
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor.parseFile"
    node_type "function"
    function "parseFile"
    intent ""
    domain_entity "parse"
    named_entities "[&#34;parse&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 138
    label "writer.flush"
    node_type "function"
    function "flush"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 139
    label "pet.setName"
    node_type "function"
    function "setName"
    intent "set"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 140
    label "org.springframework.samples.petclinic.customers.web.PetResource.save"
    node_type "function"
    function "save"
    intent "save"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 141
    label "nodes.addAll"
    node_type "function"
    function "addAll"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 142
    label "petRepository.findById(petId).orElseThrow"
    node_type "function"
    function "orElseThrow"
    intent ""
    domain_entity "else"
    named_entities "[&#34;else&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 143
    label "org.springframework.samples.petclinic.customers.model.Owner.setFirstName"
    node_type "function"
    function "setFirstName"
    intent "set"
    domain_entity "first"
    named_entities "[&#34;first&#34;, &#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 144
    label "org.springframework.samples.petclinic.vets.model.Specialty.getName"
    node_type "function"
    function "getName"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 145
    label "classMethods.keySet"
    node_type "function"
    function "keySet"
    intent ""
    domain_entity "set"
    named_entities "[&#34;set&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 146
    label "Files.walk(Paths.get(PROJECT_ROOT)).filter"
    node_type "function"
    function "filter"
    intent "filter"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 147
    label "org.springframework.samples.petclinic.customers.model.Pet.getName"
    node_type "function"
    function "getName"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 148
    label "get('/owners/2/pets/2').accept"
    node_type "function"
    function "accept"
    intent "accept"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 149
    label "this.server.shutdown"
    node_type "function"
    function "shutdown"
    intent ""
    domain_entity "shutdown"
    named_entities "[&#34;shutdown&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 150
    label "mvc.perform(get('/owners/2/pets/2').accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk()).andExpect(content().contentType('application/json')).andExpect(jsonPath('$.id').value(2)).andExpect(jsonPath('$.name').value('Basil')).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 151
    label "p.getNameAsString"
    node_type "function"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;, &#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 152
    label "org.springframework.samples.petclinic.admin.SpringBootAdminApplication.main"
    node_type "function"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 153
    label "jsonPath('$.items(1).petId').value"
    node_type "function"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 154
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.address"
    node_type "function"
    function "address"
    intent ""
    domain_entity "address"
    named_entities "[&#34;address&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 155
    label "webClientBuilder.build().get().uri"
    node_type "function"
    function "uri"
    intent ""
    domain_entity "uri"
    named_entities "[&#34;uri&#34;]"
    business_role "API Layer"
  ]
  node [
    id 156
    label "Visit.VisitBuilder.aVisit().id(1).petId"
    node_type "function"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 157
    label "Object.toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 158
    label "cbFactory.create"
    node_type "function"
    function "create"
    intent "create"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 159
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.jsonPath"
    node_type "function"
    function "jsonPath"
    intent ""
    domain_entity "json"
    named_entities "[&#34;json&#34;, &#34;path&#34;]"
    business_role "API Layer"
  ]
  node [
    id 160
    label "resource.exists"
    node_type "function"
    function "exists"
    intent "exist"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 161
    label "request.firstName"
    node_type "function"
    function "firstName"
    intent ""
    domain_entity "first"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 162
    label "org.springframework.samples.petclinic.customers.model.Owner.setAddress"
    node_type "function"
    function "setAddress"
    intent "set"
    domain_entity "address"
    named_entities "[&#34;address&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 163
    label "org.springframework.samples.petclinic.genai.AIFunctionConfiguration.listVets"
    node_type "function"
    function "listVets"
    intent ""
    domain_entity "list"
    named_entities "[&#34;vet&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 164
    label "petIds.stream().map(Object::toString).collect"
    node_type "function"
    function "collect"
    intent "collect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 165
    label "org.springframework.samples.petclinic.visits.model.Visit.id"
    node_type "function"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "[&#34;d&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 166
    label "vet.setId"
    node_type "function"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 167
    label "Optional.of"
    node_type "function"
    function "of"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 168
    label "webClient.get"
    node_type "function"
    function "get"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 169
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder"
    node_type "function"
    function "OwnerDetailsBuilder"
    intent ""
    domain_entity "owner"
    named_entities "[&#34;builder&#34;, &#34;details&#34;, &#34;owner&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 170
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.status"
    node_type "function"
    function "status"
    intent ""
    domain_entity "status"
    named_entities "[&#34;status&#34;]"
    business_role "API Layer"
  ]
  node [
    id 171
    label "c.getIdentifier"
    node_type "function"
    function "getIdentifier"
    intent "get"
    domain_entity "identifier"
    named_entities "[&#34;identifier&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 172
    label "StaticJavaParser.setConfiguration"
    node_type "function"
    function "setConfiguration"
    intent "set"
    domain_entity "configuration"
    named_entities "[&#34;configuration&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 173
    label "org.springframework.samples.petclinic.customers.web.PetResource.processUpdateForm"
    node_type "function"
    function "processUpdateForm"
    intent ""
    domain_entity "process"
    named_entities "[&#34;form&#34;, &#34;process&#34;, &#34;update&#34;]"
    business_role "API Layer"
  ]
  node [
    id 174
    label "doc.createElement"
    node_type "function"
    function "createElement"
    intent "create"
    domain_entity "element"
    named_entities "[&#34;element&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 175
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor.exportSemanticGraphML"
    node_type "function"
    function "exportSemanticGraphML"
    intent "export"
    domain_entity "semantic"
    named_entities "[&#34;graph&#34;, &#34;ml&#34;, &#34;semantic&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 176
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.city"
    node_type "function"
    function "city"
    intent ""
    domain_entity "city"
    named_entities "[&#34;city&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 177
    label "webClient.post().uri(ownersHostname + 'owners').bodyValue"
    node_type "function"
    function "bodyValue"
    intent ""
    domain_entity "body"
    named_entities "[&#34;body&#34;, &#34;value&#34;]"
    business_role "API Layer"
  ]
  node [
    id 178
    label "method.getParameters"
    node_type "function"
    function "getParameters"
    intent "get"
    domain_entity "parameter"
    named_entities "[&#34;parameter&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 179
    label "mvc.perform(get('/owners/2/pets/2').accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk()).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 180
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect(jsonPath('$.items(0).id').value(1)).andExpect(jsonPath('$.items(1).id').value(2)).andExpect(jsonPath('$.items(2).id').value(3)).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 181
    label "org.springframework.samples.petclinic.api.boundary.web.CircuitBreakerConfiguration.resilience4JConfigurationProperties"
    node_type "function"
    function "resilience4JConfigurationProperties"
    intent ""
    domain_entity "resilience"
    named_entities "[&#34;configuration&#34;, &#34;j&#34;, &#34;properties&#34;, &#34;resilience&#34;]"
    business_role "API Layer"
  ]
  node [
    id 182
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.getVisitsForPets_withAvailableVisitsService"
    node_type "function"
    function "getVisitsForPets_withAvailableVisitsService"
    intent "get"
    domain_entity "visit"
    named_entities "[&#34;available&#34;, &#34;pets&#34;, &#34;service&#34;, &#34;visit&#34;, &#34;visits&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 183
    label "request.pet"
    node_type "function"
    function "pet"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 184
    label "customersServiceClient.getOwner"
    node_type "function"
    function "getOwner"
    intent "get"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 185
    label "registry.config"
    node_type "function"
    function "config"
    intent ""
    domain_entity "config"
    named_entities "[&#34;config&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 186
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor.main"
    node_type "function"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 187
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication.routerFunction"
    node_type "function"
    function "routerFunction"
    intent ""
    domain_entity "router"
    named_entities "[&#34;function&#34;, &#34;router&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 188
    label "callGraph.values"
    node_type "function"
    function "values"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 189
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.visits"
    node_type "function"
    function "visits"
    intent ""
    domain_entity "visit"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 190
    label "ResponseEntity.status(HttpStatus.SC_SERVICE_UNAVAILABLE).body"
    node_type "function"
    function "body"
    intent ""
    domain_entity "body"
    named_entities "[&#34;body&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 191
    label "petRepository.findPetTypeById"
    node_type "function"
    function "findPetTypeById"
    intent "find"
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;, &#34;type&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 192
    label "ids.containsKey"
    node_type "function"
    function "containsKey"
    intent "contain"
    domain_entity "key"
    named_entities "[&#34;key&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 193
    label "cu.getImports().forEach"
    node_type "function"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 194
    label "org.springframework.samples.petclinic.visits.model.Visit.setDate"
    node_type "function"
    function "setDate"
    intent "set"
    domain_entity "date"
    named_entities "[&#34;date&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 195
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.lastName"
    node_type "function"
    function "lastName"
    intent ""
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 196
    label "visit.setDate"
    node_type "function"
    function "setDate"
    intent "set"
    domain_entity "date"
    named_entities "[&#34;date&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 197
    label "org.springframework.samples.petclinic.customers.model.Pet.getId"
    node_type "function"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 198
    label "webClientBuilder.build().get().uri('http://customers-service/owners/{ownerId}', ownerId).retrieve().bodyToMono"
    node_type "function"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "[&#34;body&#34;, &#34;mono&#34;]"
    business_role "API Layer"
  ]
  node [
    id 199
    label "graphml.appendChild"
    node_type "function"
    function "appendChild"
    intent "append"
    domain_entity "child"
    named_entities "[&#34;child&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 200
    label "jsonPath('$.items(0).petId').value"
    node_type "function"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 201
    label "Mockito.when(customersServiceClient.getOwner(1)).thenReturn"
    node_type "function"
    function "thenReturn"
    intent "return"
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 202
    label "org.springframework.samples.petclinic.customers.model.Pet.getBirthDate"
    node_type "function"
    function "getBirthDate"
    intent "get"
    domain_entity "birth"
    named_entities "[&#34;birth&#34;, &#34;date&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 203
    label "org.springframework.samples.petclinic.customers.model.PetType.setId"
    node_type "function"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 204
    label "u.text"
    node_type "function"
    function "text"
    intent ""
    domain_entity "text"
    named_entities "[&#34;text&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 205
    label "org.springframework.samples.petclinic.genai.AIDataProvider"
    node_type "function"
    function "AIDataProvider"
    intent ""
    domain_entity "ai"
    named_entities "[&#34;ai&#34;, &#34;data&#34;, &#34;provider&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 206
    label "org.springframework.samples.petclinic.genai.AIBeanConfiguration.loadBalancedWebClientBuilder"
    node_type "function"
    function "loadBalancedWebClientBuilder"
    intent "load"
    domain_entity "balanced"
    named_entities "[&#34;balanced&#34;, &#34;builder&#34;, &#34;client&#34;, &#34;web&#34;]"
    business_role "API Layer"
  ]
  node [
    id 207
    label "Visit.VisitBuilder.aVisit().id(2).petId(222).build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 208
    label "org.springframework.samples.petclinic.api.boundary.web.CircuitBreakerConfiguration"
    node_type "function"
    function "CircuitBreakerConfiguration"
    intent ""
    domain_entity "circuit"
    named_entities "[&#34;breaker&#34;, &#34;circuit&#34;, &#34;configuration&#34;]"
    business_role "API Layer"
  ]
  node [
    id 209
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.get"
    node_type "function"
    function "get"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 210
    label "org.springframework.samples.petclinic.config.ConfigServerApplication.main"
    node_type "function"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Configuration Layer"
  ]
  node [
    id 211
    label "file.toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 212
    label "server.url('/').toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 213
    label "org.springframework.samples.petclinic.vets.VetsServiceApplication.main"
    node_type "function"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 214
    label "content().contentType"
    node_type "function"
    function "contentType"
    intent ""
    domain_entity "content"
    named_entities "[&#34;content&#34;, &#34;type&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 215
    label "sr.withTopK"
    node_type "function"
    function "withTopK"
    intent ""
    domain_entity "k"
    named_entities "[&#34;k&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 216
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.date"
    node_type "function"
    function "date"
    intent ""
    domain_entity "date"
    named_entities "[&#34;date&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 217
    label "org.springframework.samples.petclinic.visits.web.VisitResource.read"
    node_type "function"
    function "read"
    intent "read"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 218
    label "petIds.stream().map"
    node_type "function"
    function "map"
    intent ""
    domain_entity "map"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 219
    label "PetDetails.PetDetailsBuilder.aPetDetails().id(20).name('Garfield').visits(new ArrayList<>()).build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 220
    label "SearchRequest.from(SearchRequest.defaults()).withQuery"
    node_type "function"
    function "withQuery"
    intent ""
    domain_entity "query"
    named_entities "[&#34;query&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 221
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClient"
    node_type "function"
    function "VisitsServiceClient"
    intent ""
    domain_entity "visit"
    named_entities "[&#34;client&#34;, &#34;service&#34;, &#34;visit&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 222
    label "petRepository.findById"
    node_type "function"
    function "findById"
    intent "find"
    domain_entity "i"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 223
    label "webClient.post().uri(ownersHostname + 'owners').bodyValue(ownerRequest).retrieve"
    node_type "function"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 224
    label "org.springframework.samples.petclinic.vets.model.Vet.getFirstName"
    node_type "function"
    function "getFirstName"
    intent "get"
    domain_entity "first"
    named_entities "[&#34;first&#34;, &#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 225
    label "visits.items().stream"
    node_type "function"
    function "stream"
    intent ""
    domain_entity "stream"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 226
    label "Mockito.when"
    node_type "function"
    function "when"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 227
    label "webClient.post().uri(ownersHostname + 'owners').bodyValue(ownerRequest).retrieve().bodyToMono"
    node_type "function"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "[&#34;body&#34;, &#34;mono&#34;]"
    business_role "API Layer"
  ]
  node [
    id 228
    label "ref.getScope"
    node_type "function"
    function "getScope"
    intent "get"
    domain_entity "scope"
    named_entities "[&#34;scope&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 229
    label "method.getParameters().stream().map(p -> p.getNameAsString()).reduce((a, b) -> a + ', ' + b).orElse"
    node_type "function"
    function "orElse"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 230
    label "org.springframework.samples.petclinic.visits.VisitsServiceApplication"
    node_type "function"
    function "VisitsServiceApplication"
    intent ""
    domain_entity "visits"
    named_entities "[&#34;application&#34;, &#34;service&#34;, &#34;visit&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 231
    label "ids.put"
    node_type "function"
    function "put"
    intent "put"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 232
    label "org.springframework.samples.petclinic.visits.model.VisitRepository.findByPetIdIn"
    node_type "function"
    function "findByPetIdIn"
    intent "find"
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 233
    label "method.findAll(MethodReferenceExpr.class).forEach"
    node_type "function"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 234
    label "org.springframework.samples.petclinic.customers.model.Owner.getPets"
    node_type "function"
    function "getPets"
    intent "get"
    domain_entity "pet"
    named_entities "[&#34;pet&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 235
    label "method.findAll"
    node_type "function"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 236
    label "org.springframework.samples.petclinic.customers.model.Owner"
    node_type "function"
    function "Owner"
    intent ""
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 237
    label "org.springframework.samples.petclinic.customers.model.Owner.toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 238
    label "writer.close"
    node_type "function"
    function "close"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 239
    label "org.springframework.samples.petclinic.customers.model.Owner.getFirstName"
    node_type "function"
    function "getFirstName"
    intent "get"
    domain_entity "first"
    named_entities "[&#34;first&#34;, &#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 240
    label "impArr.put"
    node_type "function"
    function "put"
    intent "put"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 241
    label "org.springframework.samples.petclinic.visits.model.Visit.build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Model"
  ]
  node [
    id 242
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.assertVisitDescriptionEquals"
    node_type "function"
    function "assertVisitDescriptionEquals"
    intent "assert"
    domain_entity "visit"
    named_entities "[&#34;description&#34;, &#34;visit&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 243
    label "org.springframework.samples.petclinic.customers.model.PetRepository.findPetTypes"
    node_type "function"
    function "findPetTypes"
    intent "find"
    domain_entity "pet"
    named_entities "[&#34;pet&#34;, &#34;types&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 244
    label "visitRepository.findByPetIdIn"
    node_type "function"
    function "findByPetIdIn"
    intent "find"
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 245
    label "TimeLimiterConfig.custom().timeoutDuration(Duration.ofSeconds(10)).build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Configuration Layer"
  ]
  node [
    id 246
    label "logger.info"
    node_type "function"
    function "info"
    intent ""
    domain_entity "info"
    named_entities "[&#34;info&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 247
    label "webClient.post().uri(ownersHostname + 'owners/' + request.ownerId() + '/pets').bodyValue(request.pet()).retrieve().bodyToMono(PetDetails.class).block"
    node_type "function"
    function "block"
    intent ""
    domain_entity "block"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 248
    label "ref.getIdentifier"
    node_type "function"
    function "getIdentifier"
    intent "get"
    domain_entity "identifier"
    named_entities "[&#34;identifier&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 249
    label "Mono.error"
    node_type "function"
    function "error"
    intent ""
    domain_entity "error"
    named_entities "[&#34;error&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 250
    label "method.getParameters().stream().map(p -> p.getNameAsString()).reduce"
    node_type "function"
    function "reduce"
    intent "reduce"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 251
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.prepareResponse"
    node_type "function"
    function "prepareResponse"
    intent "prepare"
    domain_entity "response"
    named_entities "[&#34;response&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 252
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.id"
    node_type "function"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "[&#34;d&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 253
    label "method.getParameters().stream"
    node_type "function"
    function "stream"
    intent ""
    domain_entity "stream"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 254
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder"
    node_type "function"
    function "VisitBuilder"
    intent "visit"
    domain_entity "builder"
    named_entities "[&#34;builder&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 255
    label "this.getOwner().getFirstName"
    node_type "function"
    function "getFirstName"
    intent "get"
    domain_entity "first"
    named_entities "[&#34;first&#34;, &#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 256
    label "org.springframework.samples.petclinic.vets.model.Specialty.getId"
    node_type "function"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 257
    label "petRequest.typeId"
    node_type "function"
    function "typeId"
    intent ""
    domain_entity "type"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;type&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 258
    label "org.springframework.samples.petclinic.visits.model.Visit.setId"
    node_type "function"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 259
    label "callGraph.computeIfAbsent"
    node_type "function"
    function "computeIfAbsent"
    intent ""
    domain_entity "absent"
    named_entities "[&#34;absent&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 260
    label "graphml.setAttribute"
    node_type "function"
    function "setAttribute"
    intent "set"
    domain_entity "attribute"
    named_entities "[&#34;attribute&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 261
    label "petRepository.save"
    node_type "function"
    function "save"
    intent "save"
    domain_entity ""
    named_entities "[]"
    business_role "Data Access Layer"
  ]
  node [
    id 262
    label "pet.visits"
    node_type "function"
    function "visits"
    intent ""
    domain_entity "visit"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 263
    label "calls.put"
    node_type "function"
    function "put"
    intent "put"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 264
    label "v.petId"
    node_type "function"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 265
    label "methods.add"
    node_type "function"
    function "add"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 266
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayController.getOwnerDetails"
    node_type "function"
    function "getOwnerDetails"
    intent "get"
    domain_entity "owner"
    named_entities "[&#34;details&#34;, &#34;owner&#34;]"
    business_role "API Layer"
  ]
  node [
    id 267
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.shutdown"
    node_type "function"
    function "shutdown"
    intent ""
    domain_entity "shutdown"
    named_entities "[&#34;shutdown&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 268
    label "org.springframework.samples.petclinic.customers.model.Pet.getOwner"
    node_type "function"
    function "getOwner"
    intent "get"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 269
    label "this.getOwner"
    node_type "function"
    function "getOwner"
    intent "get"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 270
    label "petIds.stream"
    node_type "function"
    function "stream"
    intent ""
    domain_entity "stream"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 271
    label "cu.getPackageDeclaration().map(pd -> pd.getNameAsString()).orElse"
    node_type "function"
    function "orElse"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 272
    label "owner.addPet"
    node_type "function"
    function "addPet"
    intent "add"
    domain_entity "pet"
    named_entities "[&#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 273
    label "petRequest.name"
    node_type "function"
    function "name"
    intent ""
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 274
    label "new ToStringCreator(this).append"
    node_type "function"
    function "append"
    intent ""
    domain_entity "append"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 275
    label "Objects.hash"
    node_type "function"
    function "hash"
    intent ""
    domain_entity "hash"
    named_entities "[&#34;hash&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 276
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect(jsonPath('$.items(0).id').value(1)).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 277
    label "call.getScope"
    node_type "function"
    function "getScope"
    intent "get"
    domain_entity "scope"
    named_entities "[&#34;scope&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 278
    label "org.springframework.samples.petclinic.api.boundary.web.FallbackController.fallback"
    node_type "function"
    function "fallback"
    intent ""
    domain_entity "fallback"
    named_entities "[&#34;fallback&#34;]"
    business_role "API Layer"
  ]
  node [
    id 279
    label "SpringApplication.run"
    node_type "function"
    function "run"
    intent "run"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 280
    label "visits.items().stream().filter(v -> v.petId() == pet.id()).toList"
    node_type "function"
    function "toList"
    intent ""
    domain_entity "list"
    named_entities "[&#34;list&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 281
    label "classMethods.put"
    node_type "function"
    function "put"
    intent "put"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 282
    label "Files.walk(Paths.get(PROJECT_ROOT)).filter(p -> p.toString().endsWith('.java')).forEach"
    node_type "function"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 283
    label "logger.error"
    node_type "function"
    function "error"
    intent ""
    domain_entity "error"
    named_entities "[&#34;error&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 284
    label "OwnerDetails.OwnerDetailsBuilder.anOwnerDetails"
    node_type "function"
    function "anOwnerDetails"
    intent ""
    domain_entity "owner"
    named_entities "[&#34;details&#34;, &#34;owner&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 285
    label "org.springframework.samples.petclinic.customers.web.PetResource.processCreationForm"
    node_type "function"
    function "processCreationForm"
    intent ""
    domain_entity "process"
    named_entities "[&#34;creation&#34;, &#34;form&#34;, &#34;process&#34;]"
    business_role "API Layer"
  ]
  node [
    id 286
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication.defaultCustomizer"
    node_type "function"
    function "defaultCustomizer"
    intent ""
    domain_entity "default"
    named_entities "[&#34;customizer&#34;, &#34;default&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 287
    label "p.toString().endsWith"
    node_type "function"
    function "endsWith"
    intent "end"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 288
    label "o.getClass"
    node_type "function"
    function "getClass"
    intent "get"
    domain_entity "class"
    named_entities "[&#34;class&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 289
    label "org.springframework.samples.petclinic.customers.model.PetType.getId"
    node_type "function"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 290
    label "given(vetRepository.findAll()).willReturn"
    node_type "function"
    function "willReturn"
    intent "return"
    domain_entity ""
    named_entities "[]"
    business_role "Data Access Layer"
  ]
  node [
    id 291
    label "ownerRepository.save"
    node_type "function"
    function "save"
    intent "save"
    domain_entity ""
    named_entities "[]"
    business_role "Data Access Layer"
  ]
  node [
    id 292
    label "owner.setAddress"
    node_type "function"
    function "setAddress"
    intent "set"
    domain_entity "address"
    named_entities "[&#34;address&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 293
    label "org.springframework.samples.petclinic.config.ConfigServerApplication"
    node_type "function"
    function "ConfigServerApplication"
    intent ""
    domain_entity "config"
    named_entities "[&#34;application&#34;, &#34;config&#34;, &#34;server&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 294
    label "ownerRepository.findById"
    node_type "function"
    function "findById"
    intent "find"
    domain_entity "i"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 295
    label "Visit.VisitBuilder.aVisit().id(1).petId(111).build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 296
    label "petclinicAiDataProvider.addOwnerToPetclinic"
    node_type "function"
    function "addOwnerToPetclinic"
    intent "add"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 297
    label "org.springframework.samples.petclinic.customers.model.OwnerRepository"
    node_type "function"
    function "OwnerRepository"
    intent ""
    domain_entity "owner"
    named_entities "[&#34;owner&#34;, &#34;repository&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 298
    label "ownerRepository.findAll"
    node_type "function"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities "[]"
    business_role "Data Access Layer"
  ]
  node [
    id 299
    label "cb.run"
    node_type "function"
    function "run"
    intent "run"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 300
    label "new ToStringCreator(this).append('id', this.getId()).append('lastName', this.getLastName()).append"
    node_type "function"
    function "append"
    intent ""
    domain_entity "append"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 301
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.jsonPath"
    node_type "function"
    function "jsonPath"
    intent ""
    domain_entity "json"
    named_entities "[&#34;json&#34;, &#34;path&#34;]"
    business_role "API Layer"
  ]
  node [
    id 302
    label "org.springframework.samples.petclinic.visits.model.VisitRepository.findByPetId"
    node_type "function"
    function "findByPetId"
    intent "find"
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 303
    label "System.out.println"
    node_type "function"
    function "println"
    intent ""
    domain_entity "println"
    named_entities "[&#34;println&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 304
    label "status().isOk"
    node_type "function"
    function "isOk"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 305
    label "webClient.post().uri"
    node_type "function"
    function "uri"
    intent ""
    domain_entity "uri"
    named_entities "[&#34;uri&#34;]"
    business_role "API Layer"
  ]
  node [
    id 306
    label "org.springframework.samples.petclinic.discovery.DiscoveryServerApplicationTests.contextLoads"
    node_type "function"
    function "contextLoads"
    intent ""
    domain_entity "context"
    named_entities "[&#34;context&#34;, &#34;load&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 307
    label "org.springframework.samples.petclinic.customers.config.MetricConfig.metricsCommonTags"
    node_type "function"
    function "metricsCommonTags"
    intent ""
    domain_entity "metric"
    named_entities "[&#34;common&#34;, &#34;metric&#34;, &#34;tags&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 308
    label "arr.put"
    node_type "function"
    function "put"
    intent "put"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 309
    label "new ToStringCreator(this).append('id', this.getId()).append"
    node_type "function"
    function "append"
    intent ""
    domain_entity "append"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 310
    label "jsonPath('$.type.id').value"
    node_type "function"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 311
    label "DocumentBuilderFactory.newInstance"
    node_type "function"
    function "newInstance"
    intent ""
    domain_entity "new"
    named_entities "[&#34;instance&#34;, &#34;new&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 312
    label "org.springframework.samples.petclinic.visits.model.Visit.getDescription"
    node_type "function"
    function "getDescription"
    intent "get"
    domain_entity "description"
    named_entities "[&#34;description&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 313
    label "node.replace"
    node_type "function"
    function "replace"
    intent "replace"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 314
    label "org.springframework.samples.petclinic.api.application.CustomersServiceClient.getOwner"
    node_type "function"
    function "getOwner"
    intent "get"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 315
    label "getPetsInternal().add"
    node_type "function"
    function "add"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 316
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody"
    node_type "function"
    function "expectBody"
    intent "expect"
    domain_entity "body"
    named_entities "[&#34;body&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 317
    label "org.springframework.samples.petclinic.customers.model.PetType.getName"
    node_type "function"
    function "getName"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 318
    label "OwnerDetails.OwnerDetailsBuilder.anOwnerDetails().pets(List.of(cat)).build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 319
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody().jsonPath('$.pets(0).name').isEqualTo"
    node_type "function"
    function "isEqualTo"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 320
    label "new ToStringCreator(this).append('id', this.getId()).append('name', this.getName()).append('birthDate', this.getBirthDate()).append('type', this.getType().getName()).append('ownerFirstname', this.getOwner().getFirstName()).append"
    node_type "function"
    function "append"
    intent ""
    domain_entity "append"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 321
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClient.setHostname"
    node_type "function"
    function "setHostname"
    intent "set"
    domain_entity "hostname"
    named_entities "[&#34;hostname&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 322
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest.shouldGetAListOfVets"
    node_type "function"
    function "shouldGetAListOfVets"
    intent "get"
    domain_entity "list"
    named_entities "[&#34;list&#34;, &#34;vet&#34;]"
    business_role "API Layer"
  ]
  node [
    id 323
    label "ServerResponse.ok().contentType(MediaType.TEXT_HTML).bodyValue"
    node_type "function"
    function "bodyValue"
    intent ""
    domain_entity "body"
    named_entities "[&#34;body&#34;, &#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 324
    label "jsonPath('$.items(0).id').value"
    node_type "function"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 325
    label "jsonPath('$.items(2).id').value"
    node_type "function"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 326
    label "visitsServiceClient.getVisitsForPets(owner.getPetIds()).transform(it -> {      ReactiveCircuitBreaker cb = cbFactory.create('getOwnerDetails');      return cb.run(it, throwable -> emptyVisitsForPets());  }).map"
    node_type "function"
    function "map"
    intent ""
    domain_entity "map"
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 327
    label "jsonPath('$.items(1).id').value"
    node_type "function"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 328
    label "((SimpleVectorStore) this.vectorStore).save"
    node_type "function"
    function "save"
    intent "save"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 329
    label "this.getType().getName"
    node_type "function"
    function "getName"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 330
    label "new ToStringCreator(this).append('id', this.getId()).append('name', this.getName()).append('birthDate', this.getBirthDate()).append('type', this.getType().getName()).append"
    node_type "function"
    function "append"
    intent ""
    domain_entity "append"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 331
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication.main"
    node_type "function"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 332
    label "org.springframework.samples.petclinic.vets.model.Vet.getNrOfSpecialties"
    node_type "function"
    function "getNrOfSpecialties"
    intent "get"
    domain_entity "nr"
    named_entities "[&#34;nr&#34;, &#34;specialties&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 333
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.setupPet"
    node_type "function"
    function "setupPet"
    intent ""
    domain_entity "setup"
    named_entities "[&#34;pet&#34;]"
    business_role "API Layer"
  ]
  node [
    id 334
    label "new Resilience4JConfigBuilder(id).circuitBreakerConfig"
    node_type "function"
    function "circuitBreakerConfig"
    intent ""
    domain_entity "circuit"
    named_entities "[&#34;breaker&#34;, &#34;circuit&#34;, &#34;config&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 335
    label "callsSet.add"
    node_type "function"
    function "add"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 336
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.firstName"
    node_type "function"
    function "firstName"
    intent ""
    domain_entity "first"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 337
    label "transformer.setOutputProperty"
    node_type "function"
    function "setOutputProperty"
    intent "set"
    domain_entity "output"
    named_entities "[&#34;output&#34;, &#34;property&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 338
    label "method.getNameAsString"
    node_type "function"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;, &#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 339
    label "new ToStringCreator(this).append('id', this.getId()).append('lastName', this.getLastName()).append('firstName', this.getFirstName()).append('address', this.address).append('city', this.city).append('telephone', this.telephone).toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 340
    label "org.springframework.samples.petclinic.customers.model.PetType.setName"
    node_type "function"
    function "setName"
    intent "set"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 341
    label "method.getType().asString"
    node_type "function"
    function "asString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 342
    label "callGraph.values().forEach"
    node_type "function"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 343
    label "webClientBuilder.build().get().uri(hostname + 'pets/visits?petId={petId}', joinIds(petIds)).retrieve"
    node_type "function"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 344
    label "pet.setOwner"
    node_type "function"
    function "setOwner"
    intent "set"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 345
    label "this.chatClient.prompt().user(u -> u.text(query)).call().content"
    node_type "function"
    function "content"
    intent ""
    domain_entity "content"
    named_entities "[&#34;content&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 346
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody().jsonPath('$.pets(0).name').isEqualTo('Garfield').jsonPath"
    node_type "function"
    function "jsonPath"
    intent ""
    domain_entity "json"
    named_entities "[&#34;json&#34;, &#34;path&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 347
    label "mvc.perform(get('/owners/2/pets/2').accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk()).andExpect(content().contentType('application/json')).andExpect(jsonPath('$.id').value(2)).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 348
    label "i.toString().trim"
    node_type "function"
    function "trim"
    intent "trim"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 349
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody().jsonPath('$.pets(0).name').isEqualTo('Garfield').jsonPath('$.pets(0).visits(0).description').isEqualTo"
    node_type "function"
    function "isEqualTo"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 350
    label "visits.items"
    node_type "function"
    function "items"
    intent ""
    domain_entity "item"
    named_entities "[&#34;item&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 351
    label "webClient.get().uri(ownersHostname + 'owners').retrieve().bodyToMono"
    node_type "function"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "[&#34;body&#34;, &#34;mono&#34;]"
    business_role "API Layer"
  ]
  node [
    id 352
    label "new File(OUTPUT_DIR).mkdirs"
    node_type "function"
    function "mkdirs"
    intent ""
    domain_entity "mkdir"
    named_entities "[&#34;mkdir&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 353
    label "this.chatClient.prompt().user"
    node_type "function"
    function "user"
    intent ""
    domain_entity "user"
    named_entities "[&#34;user&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 354
    label "org.springframework.samples.petclinic.vets.model.Vet.setId"
    node_type "function"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 355
    label "org.springframework.samples.petclinic.customers.model.Pet.setType"
    node_type "function"
    function "setType"
    intent "set"
    domain_entity "type"
    named_entities "[&#34;type&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 356
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.petId"
    node_type "function"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 357
    label "TimeLimiterRegistry.ofDefaults"
    node_type "function"
    function "ofDefaults"
    intent ""
    domain_entity "default"
    named_entities "[&#34;default&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 358
    label "org.springframework.samples.petclinic.customers.model.Pet"
    node_type "function"
    function "Pet"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;pet&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 359
    label "this.server.enqueue"
    node_type "function"
    function "enqueue"
    intent ""
    domain_entity "enqueue"
    named_entities "[&#34;enqueue&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 360
    label "node.replace('\'', ''').replace('\n', ' ').replace"
    node_type "function"
    function "replace"
    intent "replace"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 361
    label "org.springframework.samples.petclinic.api.ApiGatewayApplicationTests.contextLoads"
    node_type "function"
    function "contextLoads"
    intent ""
    domain_entity "context"
    named_entities "[&#34;context&#34;, &#34;load&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 362
    label "node.replace('\'', ''').replace"
    node_type "function"
    function "replace"
    intent "replace"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 363
    label "SearchRequest.defaults"
    node_type "function"
    function "defaults"
    intent ""
    domain_entity "default"
    named_entities "[&#34;default&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 364
    label "documents.size"
    node_type "function"
    function "size"
    intent ""
    domain_entity "size"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 365
    label "org.springframework.samples.petclinic.genai.AIBeanConfiguration.vectorStore"
    node_type "function"
    function "vectorStore"
    intent ""
    domain_entity "vector"
    named_entities "[&#34;store&#34;, &#34;vector&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 366
    label "org.springframework.samples.petclinic.vets.web.VetResource"
    node_type "function"
    function "VetResource"
    intent ""
    domain_entity "vet"
    named_entities "[&#34;resource&#34;, &#34;vet&#34;]"
    business_role "API Layer"
  ]
  node [
    id 367
    label "org.springframework.samples.petclinic.genai.GenAIServiceApplication"
    node_type "function"
    function "GenAIServiceApplication"
    intent ""
    domain_entity "gen"
    named_entities "[&#34;ai&#34;, &#34;application&#34;, &#34;gen&#34;, &#34;service&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 368
    label "ownerRepository.findById(ownerId).orElseThrow"
    node_type "function"
    function "orElseThrow"
    intent ""
    domain_entity "else"
    named_entities "[&#34;else&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 369
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication.loadBalancedRestTemplate"
    node_type "function"
    function "loadBalancedRestTemplate"
    intent "load"
    domain_entity "balanced"
    named_entities "[&#34;balanced&#34;, &#34;rest&#34;, &#34;template&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 370
    label "c.getScope().map"
    node_type "function"
    function "map"
    intent ""
    domain_entity "map"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 371
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayControllerTest"
    node_type "function"
    function "ApiGatewayControllerTest"
    intent ""
    domain_entity "api"
    named_entities "[&#34;api&#34;, &#34;controller&#34;, &#34;gateway&#34;, &#34;test&#34;]"
    business_role "API Layer"
  ]
  node [
    id 372
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder"
    node_type "function"
    function "PetDetailsBuilder"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;builder&#34;, &#34;details&#34;, &#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 373
    label "CircuitBreakerConfig.ofDefaults"
    node_type "function"
    function "ofDefaults"
    intent ""
    domain_entity "default"
    named_entities "[&#34;default&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 374
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.aPetDetails"
    node_type "function"
    function "aPetDetails"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;detail&#34;, &#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 375
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.given"
    node_type "function"
    function "given"
    intent "give"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 376
    label "org.springframework.samples.petclinic.vets.model.Vet.setFirstName"
    node_type "function"
    function "setFirstName"
    intent "set"
    domain_entity "first"
    named_entities "[&#34;first&#34;, &#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 377
    label "visit.setDescription"
    node_type "function"
    function "setDescription"
    intent "set"
    domain_entity "description"
    named_entities "[&#34;description&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 378
    label "ServerResponse.ok"
    node_type "function"
    function "ok"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 379
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk().expectBody().jsonPath('$.pets(0).name').isEqualTo('Garfield').jsonPath('$.pets(0).visits').isEmpty"
    node_type "function"
    function "isEmpty"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 380
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.shouldGetAPetInJSonFormat"
    node_type "function"
    function "shouldGetAPetInJSonFormat"
    intent "get"
    domain_entity "pet"
    named_entities "[&#34;format&#34;, &#34;j&#34;, &#34;pet&#34;, &#34;son&#34;]"
    business_role "API Layer"
  ]
  node [
    id 381
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest"
    node_type "function"
    function "VisitResourceTest"
    intent "visit"
    domain_entity "resource"
    named_entities "[&#34;resource&#34;, &#34;test&#34;]"
    business_role "API Layer"
  ]
  node [
    id 382
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.id"
    node_type "function"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "[&#34;d&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 383
    label "new ToStringCreator(this).append('id', this.getId()).append('lastName', this.getLastName()).append('firstName', this.getFirstName()).append"
    node_type "function"
    function "append"
    intent ""
    domain_entity "append"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 384
    label "org.springframework.samples.petclinic.vets.model.Vet.getSpecialties"
    node_type "function"
    function "getSpecialties"
    intent "get"
    domain_entity "specialty"
    named_entities "[&#34;specialty&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 385
    label "this.getLastName"
    node_type "function"
    function "getLastName"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 386
    label "org.springframework.samples.petclinic.customers.model.Pet.getType"
    node_type "function"
    function "getType"
    intent "get"
    domain_entity "type"
    named_entities "[&#34;type&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 387
    label "org.springframework.samples.petclinic.genai.AIFunctionConfiguration.addPetToOwner"
    node_type "function"
    function "addPetToOwner"
    intent "add"
    domain_entity "pet"
    named_entities "[&#34;owner&#34;, &#34;pet&#34;, &#34;to&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 388
    label "jsonPath('$(0).id').value"
    node_type "function"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 389
    label "clazz.findAll(MethodDeclaration.class).forEach"
    node_type "function"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 390
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.telephone"
    node_type "function"
    function "telephone"
    intent ""
    domain_entity "telephone"
    named_entities "[&#34;telephone&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 391
    label "json.getBytes"
    node_type "function"
    function "getBytes"
    intent "get"
    domain_entity "byte"
    named_entities "[&#34;byte&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 392
    label "classMethods.values().forEach"
    node_type "function"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 393
    label "new ToStringCreator(this).append('id', this.getId()).append('name', this.getName()).append('birthDate', this.getBirthDate()).append"
    node_type "function"
    function "append"
    intent ""
    domain_entity "append"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 394
    label "org.springframework.samples.petclinic.visits.model.VisitRepository"
    node_type "function"
    function "VisitRepository"
    intent "visit"
    domain_entity "repository"
    named_entities "[&#34;repository&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 395
    label "cu.getImports"
    node_type "function"
    function "getImports"
    intent "get"
    domain_entity "import"
    named_entities "[&#34;import&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 396
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.asList"
    node_type "function"
    function "asList"
    intent ""
    domain_entity "list"
    named_entities "[&#34;list&#34;]"
    business_role "API Layer"
  ]
  node [
    id 397
    label "org.springframework.samples.petclinic.visits.config.MetricConfig"
    node_type "function"
    function "MetricConfig"
    intent ""
    domain_entity "metric"
    named_entities "[&#34;config&#34;, &#34;metric&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 398
    label "org.springframework.samples.petclinic.visits.model.Visit.description"
    node_type "function"
    function "description"
    intent ""
    domain_entity "description"
    named_entities "[&#34;description&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 399
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.shouldFetchVisits"
    node_type "function"
    function "shouldFetchVisits"
    intent "fetch"
    domain_entity "visit"
    named_entities "[&#34;fetch&#34;, &#34;visit&#34;]"
    business_role "API Layer"
  ]
  node [
    id 400
    label "Mono.just"
    node_type "function"
    function "just"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 401
    label "PosixFilePermissions.asFileAttribute"
    node_type "function"
    function "asFileAttribute"
    intent ""
    domain_entity "file"
    named_entities "[&#34;attribute&#34;, &#34;file&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 402
    label "org.springframework.samples.petclinic.customers.model.Pet.setOwner"
    node_type "function"
    function "setOwner"
    intent "set"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 403
    label "this.chatClient.prompt"
    node_type "function"
    function "prompt"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 404
    label "org.springframework.samples.petclinic.visits.model.Visit"
    node_type "function"
    function "Visit"
    intent "visit"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Model"
  ]
  node [
    id 405
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.content"
    node_type "function"
    function "content"
    intent ""
    domain_entity "content"
    named_entities "[&#34;content&#34;]"
    business_role "API Layer"
  ]
  node [
    id 406
    label "RouterFunctions.resources('/**', new ClassPathResource('static/')).andRoute"
    node_type "function"
    function "andRoute"
    intent ""
    domain_entity "route"
    named_entities "[&#34;route&#34;]"
    business_role "API Layer"
  ]
  node [
    id 407
    label "Visit.VisitBuilder.aVisit().id(3).petId(222).build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 408
    label "getSpecialtiesInternal().add"
    node_type "function"
    function "add"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 409
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClient.joinIds"
    node_type "function"
    function "joinIds"
    intent "join"
    domain_entity "ids"
    named_entities "[&#34;ids&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 410
    label "classMethods.values"
    node_type "function"
    function "values"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 411
    label "entry.getValue"
    node_type "function"
    function "getValue"
    intent "get"
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 412
    label "PropertyComparator.sort"
    node_type "function"
    function "sort"
    intent ""
    domain_entity "sort"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 413
    label "Files.createTempFile"
    node_type "function"
    function "createTempFile"
    intent "create"
    domain_entity "temp"
    named_entities "[&#34;file&#34;, &#34;temp&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 414
    label "i.toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 415
    label "webClientBuilder.build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 416
    label "Visit.VisitBuilder.aVisit"
    node_type "function"
    function "aVisit"
    intent ""
    domain_entity "visit"
    named_entities "[&#34;visit&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 417
    label "org.springframework.samples.petclinic.visits.model.Visit.petId"
    node_type "function"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 418
    label "clazz.getNameAsString"
    node_type "function"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;, &#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 419
    label "org.springframework.samples.petclinic.config.PetclinicConfigServerApplicationTests"
    node_type "function"
    function "PetclinicConfigServerApplicationTests"
    intent ""
    domain_entity "petclinic"
    named_entities "[&#34;application&#34;, &#34;config&#34;, &#34;petclinic&#34;, &#34;server&#34;, &#34;tests&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 420
    label "org.springframework.samples.petclinic.genai.GenAIServiceApplication.main"
    node_type "function"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 421
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect(jsonPath('$.items(0).id').value(1)).andExpect(jsonPath('$.items(1).id').value(2)).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 422
    label "org.springframework.samples.petclinic.customers.model.Pet.hashCode"
    node_type "function"
    function "hashCode"
    intent "hash"
    domain_entity "code"
    named_entities "[&#34;code&#34;, &#34;hash&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 423
    label "org.springframework.samples.petclinic.customers.model.Owner.getPetsInternal"
    node_type "function"
    function "getPetsInternal"
    intent "get"
    domain_entity "pets"
    named_entities "[&#34;internal&#34;, &#34;pets&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 424
    label "s.toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 425
    label "org.springframework.samples.petclinic.visits.VisitsServiceApplication.main"
    node_type "function"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 426
    label "org.springframework.samples.petclinic.discovery.DiscoveryServerApplication.main"
    node_type "function"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 427
    label "new ToStringCreator(this).append('id', this.getId()).append('lastName', this.getLastName()).append('firstName', this.getFirstName()).append('address', this.address).append('city', this.city).append"
    node_type "function"
    function "append"
    intent ""
    domain_entity "append"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 428
    label "PetDetails.PetDetailsBuilder.aPetDetails().id"
    node_type "function"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "[&#34;d&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 429
    label "((SimpleVectorStore) this.vectorStore).load"
    node_type "function"
    function "load"
    intent ""
    domain_entity "load"
    named_entities "[&#34;load&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 430
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.birthDate"
    node_type "function"
    function "birthDate"
    intent ""
    domain_entity "birth"
    named_entities "[&#34;birth&#34;, &#34;date&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 431
    label "clazz.findAll"
    node_type "function"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 432
    label "org.springframework.samples.petclinic.customers.model.Pet.setId"
    node_type "function"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 433
    label "visits.items().get"
    node_type "function"
    function "get"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 434
    label "Visit.VisitBuilder.aVisit().id"
    node_type "function"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "[&#34;d&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 435
    label "registry.config().commonTags"
    node_type "function"
    function "commonTags"
    intent ""
    domain_entity "tags"
    named_entities "[&#34;tags&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 436
    label "mvc.perform"
    node_type "function"
    function "perform"
    intent "perform"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 437
    label "petclinicAiProvider.getVets"
    node_type "function"
    function "getVets"
    intent "get"
    domain_entity "vet"
    named_entities "[&#34;vet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 438
    label "config.setLanguageLevel"
    node_type "function"
    function "setLanguageLevel"
    intent "set"
    domain_entity "language"
    named_entities "[&#34;language&#34;, &#34;level&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 439
    label "org.springframework.samples.petclinic.customers.model.Owner.addPet"
    node_type "function"
    function "addPet"
    intent "add"
    domain_entity "pet"
    named_entities "[&#34;pet&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 440
    label "jsonPath('$.id').value"
    node_type "function"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 441
    label "reader.get"
    node_type "function"
    function "get"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 442
    label "PetDetails.PetDetailsBuilder.aPetDetails"
    node_type "function"
    function "aPetDetails"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;detail&#34;, &#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 443
    label "jsonPath('$.name').value"
    node_type "function"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 444
    label "objectMapper.writeValueAsString"
    node_type "function"
    function "writeValueAsString"
    intent "write"
    domain_entity "value"
    named_entities "[&#34;string&#34;, &#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 445
    label "customersServiceClient.getOwner(ownerId).flatMap"
    node_type "function"
    function "flatMap"
    intent ""
    domain_entity "map"
    named_entities "[&#34;map&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 446
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect(status().isOk()).andExpect(jsonPath('$.items(0).id').value(1)).andExpect(jsonPath('$.items(1).id').value(2)).andExpect(jsonPath('$.items(2).id').value(3)).andExpect(jsonPath('$.items(0).petId').value(111)).andExpect(jsonPath('$.items(1).petId').value(222)).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 447
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.setUp"
    node_type "function"
    function "setUp"
    intent "set"
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 448
    label "request.telephone"
    node_type "function"
    function "telephone"
    intent ""
    domain_entity "telephone"
    named_entities "[&#34;telephone&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 449
    label "this.vectorStore.add"
    node_type "function"
    function "add"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 450
    label "owner.pets"
    node_type "function"
    function "pets"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 451
    label "ref.getScope().toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 452
    label "org.springframework.samples.petclinic.customers.model.PetRepository.findPetTypeById"
    node_type "function"
    function "findPetTypeById"
    intent "find"
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;, &#34;type&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 453
    label "org.springframework.samples.petclinic.customers.web.PetResourceTest.status"
    node_type "function"
    function "status"
    intent ""
    domain_entity "status"
    named_entities "[&#34;status&#34;]"
    business_role "API Layer"
  ]
  node [
    id 454
    label "TransformerFactory.newInstance"
    node_type "function"
    function "newInstance"
    intent ""
    domain_entity "new"
    named_entities "[&#34;instance&#34;, &#34;new&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 455
    label "request.address"
    node_type "function"
    function "address"
    intent ""
    domain_entity "address"
    named_entities "[&#34;address&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 456
    label "getSpecialtiesInternal().size"
    node_type "function"
    function "size"
    intent ""
    domain_entity "size"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 457
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.description"
    node_type "function"
    function "description"
    intent ""
    domain_entity "description"
    named_entities "[&#34;description&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 458
    label "org.springframework.samples.petclinic.customers.web.PetResource.getPetTypes"
    node_type "function"
    function "getPetTypes"
    intent "get"
    domain_entity "pet"
    named_entities "[&#34;pet&#34;, &#34;types&#34;]"
    business_role "API Layer"
  ]
  node [
    id 459
    label "this.getBirthDate"
    node_type "function"
    function "getBirthDate"
    intent "get"
    domain_entity "birth"
    named_entities "[&#34;birth&#34;, &#34;date&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 460
    label "org.springframework.samples.petclinic.api.boundary.web.FallbackController"
    node_type "function"
    function "FallbackController"
    intent ""
    domain_entity "fallback"
    named_entities "[&#34;controller&#34;, &#34;fallback&#34;]"
    business_role "API Layer"
  ]
  node [
    id 461
    label "org.springframework.samples.petclinic.analysis.RepoWideExtractor.exportStaticGraphGML"
    node_type "function"
    function "exportStaticGraphGML"
    intent ""
    domain_entity "export"
    named_entities "[&#34;export&#34;, &#34;gml&#34;, &#34;graph&#34;, &#34;static&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 462
    label "doc.appendChild"
    node_type "function"
    function "appendChild"
    intent "append"
    domain_entity "child"
    named_entities "[&#34;child&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 463
    label "List.of"
    node_type "function"
    function "of"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 464
    label "client.get"
    node_type "function"
    function "get"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 465
    label "Visit.VisitBuilder.aVisit().id(3).petId"
    node_type "function"
    function "petId"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 466
    label "org.springframework.samples.petclinic.visits.model.Visit.getDate"
    node_type "function"
    function "getDate"
    intent "get"
    domain_entity "date"
    named_entities "[&#34;date&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 467
    label "ownerEntityMapper.map"
    node_type "function"
    function "map"
    intent ""
    domain_entity "map"
    named_entities "[]"
    business_role "Domain Model"
  ]
  node [
    id 468
    label "org.springframework.samples.petclinic.customers.web.mapper.Mapper"
    node_type "function"
    function "Mapper"
    intent ""
    domain_entity ""
    named_entities "[&#34;mapper&#34;]"
    business_role "API Layer"
  ]
  node [
    id 469
    label "org.springframework.samples.petclinic.customers.web.PetResource.findPetById"
    node_type "function"
    function "findPetById"
    intent "find"
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;pet&#34;]"
    business_role "API Layer"
  ]
  node [
    id 470
    label "owner.setLastName"
    node_type "function"
    function "setLastName"
    intent "set"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 471
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.get"
    node_type "function"
    function "get"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 472
    label "org.springframework.samples.petclinic.vets.model.Vet.getLastName"
    node_type "function"
    function "getLastName"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 473
    label "org.springframework.samples.petclinic.visits.config.MetricConfig.timedAspect"
    node_type "function"
    function "timedAspect"
    intent "time"
    domain_entity "aspect"
    named_entities "[&#34;aspect&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 474
    label "org.springframework.samples.petclinic.customers.model.Pet.toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 475
    label "org.springframework.samples.petclinic.customers.web.mapper.Mapper.map"
    node_type "function"
    function "map"
    intent ""
    domain_entity "map"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 476
    label "this.getOwner().getLastName"
    node_type "function"
    function "getLastName"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 477
    label "webClient.get().uri(ownersHostname + 'owners').retrieve"
    node_type "function"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 478
    label "org.springframework.samples.petclinic.api.boundary.web.CircuitBreakerConfiguration.timeLimiterRegistry"
    node_type "function"
    function "timeLimiterRegistry"
    intent ""
    domain_entity "time"
    named_entities "[&#34;limiter&#34;, &#34;registry&#34;, &#34;time&#34;]"
    business_role "API Layer"
  ]
  node [
    id 479
    label "org.springframework.samples.petclinic.genai.AIDataProvider.getVets"
    node_type "function"
    function "getVets"
    intent "get"
    domain_entity "vet"
    named_entities "[&#34;vet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 480
    label "visit.setPetId"
    node_type "function"
    function "setPetId"
    intent "set"
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 481
    label "org.springframework.samples.petclinic.customers.model.PetRepository"
    node_type "function"
    function "PetRepository"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;pet&#34;, &#34;repository&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 482
    label "org.springframework.samples.petclinic.customers.model.Owner.getAddress"
    node_type "function"
    function "getAddress"
    intent "get"
    domain_entity "address"
    named_entities "[&#34;address&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 483
    label "new ToStringCreator(this).append('id', this.getId()).append('name', this.getName()).append('birthDate', this.getBirthDate()).append('type', this.getType().getName()).append('ownerFirstname', this.getOwner().getFirstName()).append('ownerLastname', this.getOwner().getLastName()).toString"
    node_type "function"
    function "toString"
    intent ""
    domain_entity "string"
    named_entities "[&#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 484
    label "file.getAbsolutePath"
    node_type "function"
    function "getAbsolutePath"
    intent "get"
    domain_entity "absolute"
    named_entities "[&#34;absolute&#34;, &#34;path&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 485
    label "org.springframework.samples.petclinic.api.ApiGatewayApplication"
    node_type "function"
    function "ApiGatewayApplication"
    intent ""
    domain_entity "api"
    named_entities "[&#34;api&#34;, &#34;application&#34;, &#34;gateway&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 486
    label "mvc.perform(get('/owners/2/pets/2').accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk()).andExpect(content().contentType('application/json')).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 487
    label "callGraph.computeIfAbsent(fullMethodName, k -> new HashSet<>()).add"
    node_type "function"
    function "add"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 488
    label "org.springframework.samples.petclinic.visits.model.Visit.aVisit"
    node_type "function"
    function "aVisit"
    intent ""
    domain_entity "visit"
    named_entities "[&#34;visit&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 489
    label "visits.items().size"
    node_type "function"
    function "size"
    intent ""
    domain_entity "size"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 490
    label "petType.setId"
    node_type "function"
    function "setId"
    intent "set"
    domain_entity "d"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 491
    label "org.springframework.samples.petclinic.customers.web.OwnerResource.updateOwner"
    node_type "function"
    function "updateOwner"
    intent ""
    domain_entity "update"
    named_entities "[&#34;owner&#34;]"
    business_role "API Layer"
  ]
  node [
    id 492
    label "org.springframework.samples.petclinic.customers.model.Pet.setBirthDate"
    node_type "function"
    function "setBirthDate"
    intent "set"
    domain_entity "birth"
    named_entities "[&#34;birth&#34;, &#34;date&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 493
    label "webClient.get().uri"
    node_type "function"
    function "uri"
    intent ""
    domain_entity "uri"
    named_entities "[&#34;uri&#34;]"
    business_role "API Layer"
  ]
  node [
    id 494
    label "cu.findAll(ClassOrInterfaceDeclaration.class).forEach"
    node_type "function"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 495
    label "org.springframework.samples.petclinic.vets.model.Vet.setLastName"
    node_type "function"
    function "setLastName"
    intent "set"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 496
    label "cu.getPackageDeclaration().map"
    node_type "function"
    function "map"
    intent ""
    domain_entity "map"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 497
    label "resource.getFile"
    node_type "function"
    function "getFile"
    intent "get"
    domain_entity "file"
    named_entities "[&#34;file&#34;]"
    business_role "API Layer"
  ]
  node [
    id 498
    label "this.getFirstName"
    node_type "function"
    function "getFirstName"
    intent "get"
    domain_entity "first"
    named_entities "[&#34;first&#34;, &#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 499
    label "pkg.isEmpty"
    node_type "function"
    function "isEmpty"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 500
    label "transformer.transform"
    node_type "function"
    function "transform"
    intent "transform"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 501
    label "org.springframework.samples.petclinic.genai.PetclinicChatClient"
    node_type "function"
    function "PetclinicChatClient"
    intent ""
    domain_entity "petclinic"
    named_entities "[&#34;chat&#34;, &#34;client&#34;, &#34;petclinic&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 502
    label "org.springframework.samples.petclinic.customers.model.Owner.getTelephone"
    node_type "function"
    function "getTelephone"
    intent "get"
    domain_entity "telephone"
    named_entities "[&#34;telephone&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 503
    label "visitRepository.findByPetId"
    node_type "function"
    function "findByPetId"
    intent "find"
    domain_entity "pet"
    named_entities "[&#34;d&#34;, &#34;i&#34;, &#34;pet&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 504
    label "visits.items().get(0).description"
    node_type "function"
    function "description"
    intent ""
    domain_entity "description"
    named_entities "[&#34;description&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 505
    label "entry.getKey"
    node_type "function"
    function "getKey"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 506
    label "org.springframework.samples.petclinic.customers.web.mapper.OwnerEntityMapper"
    node_type "function"
    function "OwnerEntityMapper"
    intent ""
    domain_entity "owner"
    named_entities "[&#34;entity&#34;, &#34;mapper&#34;, &#34;owner&#34;]"
    business_role "API Layer"
  ]
  node [
    id 507
    label "server.url"
    node_type "function"
    function "url"
    intent ""
    domain_entity "url"
    named_entities "[&#34;url&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 508
    label "org.springframework.samples.petclinic.api.application.CustomersServiceClient"
    node_type "function"
    function "CustomersServiceClient"
    intent ""
    domain_entity "customers"
    named_entities "[&#34;client&#34;, &#34;customer&#34;, &#34;service&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 509
    label "get('/vets').accept"
    node_type "function"
    function "accept"
    intent "accept"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 510
    label "given(visitRepository.findByPetIdIn(asList(111, 222))).willReturn"
    node_type "function"
    function "willReturn"
    intent "return"
    domain_entity ""
    named_entities "[]"
    business_role "Data Access Layer"
  ]
  node [
    id 511
    label "pd.getNameAsString"
    node_type "function"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;, &#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 512
    label "node.replace('\'', ''').replace('\n', ' ').replace('\r', ' ').replace('(', '(').replace"
    node_type "function"
    function "replace"
    intent "replace"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 513
    label "webClient.post().uri(ownersHostname + 'owners/' + request.ownerId() + '/pets').bodyValue(request.pet()).retrieve().bodyToMono"
    node_type "function"
    function "bodyToMono"
    intent ""
    domain_entity "body"
    named_entities "[&#34;body&#34;, &#34;mono&#34;]"
    business_role "API Layer"
  ]
  node [
    id 514
    label "petRepository.findPetTypes"
    node_type "function"
    function "findPetTypes"
    intent "find"
    domain_entity "pet"
    named_entities "[&#34;pet&#34;, &#34;types&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 515
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.type"
    node_type "function"
    function "type"
    intent ""
    domain_entity "type"
    named_entities "[&#34;type&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 516
    label "petclinicAiProvider.getAllOwners"
    node_type "function"
    function "getAllOwners"
    intent "get"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 517
    label "response.setHeader('Content-Type', 'application/json').setBody"
    node_type "function"
    function "setBody"
    intent "set"
    domain_entity "body"
    named_entities "[&#34;body&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 518
    label "javaFiles.add"
    node_type "function"
    function "add"
    intent "add"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 519
    label "petRepository.findPetTypeById(petRequest.typeId()).ifPresent"
    node_type "function"
    function "ifPresent"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Data Access Layer"
  ]
  node [
    id 520
    label "request.lastName"
    node_type "function"
    function "lastName"
    intent ""
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 521
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.pets"
    node_type "function"
    function "pets"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;pet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 522
    label "topMatches.stream().map(Document::getContent).toList"
    node_type "function"
    function "toList"
    intent ""
    domain_entity "list"
    named_entities "[&#34;list&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 523
    label "org.springframework.samples.petclinic.api.ApiGatewayApplicationTests"
    node_type "function"
    function "ApiGatewayApplicationTests"
    intent "test"
    domain_entity "api"
    named_entities "[&#34;api&#34;, &#34;application&#34;, &#34;gateway&#34;, &#34;tests&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 524
    label "jsonPath('$.items(2).petId').value"
    node_type "function"
    function "value"
    intent ""
    domain_entity "value"
    named_entities "[&#34;value&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 525
    label "Files.createTempFile('vectorstore', '.json', attr).toFile"
    node_type "function"
    function "toFile"
    intent "file"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 526
    label "org.springframework.samples.petclinic.vets.model.Vet.getSpecialtiesInternal"
    node_type "function"
    function "getSpecialtiesInternal"
    intent "get"
    domain_entity "specialties"
    named_entities "[&#34;specialties&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 527
    label "org.springframework.samples.petclinic.customers.model.PetType"
    node_type "function"
    function "PetType"
    intent ""
    domain_entity "pet"
    named_entities "[&#34;pet&#34;, &#34;type&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 528
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.status"
    node_type "function"
    function "status"
    intent ""
    domain_entity "status"
    named_entities "[&#34;status&#34;]"
    business_role "API Layer"
  ]
  node [
    id 529
    label "webClientBuilder.build().get"
    node_type "function"
    function "get"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 530
    label "org.springframework.samples.petclinic.customers.model.Owner.getId"
    node_type "function"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 531
    label "org.springframework.samples.petclinic.customers.model.Owner.setLastName"
    node_type "function"
    function "setLastName"
    intent "set"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 532
    label "org.springframework.samples.petclinic.visits.model.VisitBuilder.build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Model"
  ]
  node [
    id 533
    label "org.springframework.samples.petclinic.customers.web.OwnerResource.findAll"
    node_type "function"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 534
    label "this.getName"
    node_type "function"
    function "getName"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 535
    label "visits.items().stream().filter"
    node_type "function"
    function "filter"
    intent "filter"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 536
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.jsonPath"
    node_type "function"
    function "jsonPath"
    intent ""
    domain_entity "json"
    named_entities "[&#34;json&#34;, &#34;path&#34;]"
    business_role "API Layer"
  ]
  node [
    id 537
    label "org.springframework.samples.petclinic.customers.model.Owner.setTelephone"
    node_type "function"
    function "setTelephone"
    intent "set"
    domain_entity "telephone"
    named_entities "[&#34;telephone&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 538
    label "response.setHeader"
    node_type "function"
    function "setHeader"
    intent "set"
    domain_entity "header"
    named_entities "[&#34;header&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 539
    label "SearchRequest.from(SearchRequest.defaults()).withQuery(vetAsJson).withTopK"
    node_type "function"
    function "withTopK"
    intent ""
    domain_entity "k"
    named_entities "[&#34;k&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 540
    label "org.springframework.samples.petclinic.api.dto.PetDetailsBuilder.build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 541
    label "Mockito.when(visitsServiceClient.getVisitsForPets(Collections.singletonList(cat.id()))).thenReturn"
    node_type "function"
    function "thenReturn"
    intent "return"
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 542
    label "webClient.post().uri(ownersHostname + 'owners').bodyValue(ownerRequest).retrieve().bodyToMono(OwnerDetails.class).block"
    node_type "function"
    function "block"
    intent ""
    domain_entity "block"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 543
    label "org.springframework.samples.petclinic.vets.model.VetRepository"
    node_type "function"
    function "VetRepository"
    intent ""
    domain_entity "vet"
    named_entities "[&#34;repository&#34;, &#34;vet&#34;]"
    business_role "Data Access Layer"
  ]
  node [
    id 544
    label "org.springframework.samples.petclinic.genai.AIBeanConfiguration.chatMemory"
    node_type "function"
    function "chatMemory"
    intent ""
    domain_entity "chat"
    named_entities "[&#34;memory&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 545
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayController"
    node_type "function"
    function "ApiGatewayController"
    intent ""
    domain_entity "api"
    named_entities "[&#34;api&#34;, &#34;controller&#34;, &#34;gateway&#34;]"
    business_role "API Layer"
  ]
  node [
    id 546
    label "request.city"
    node_type "function"
    function "city"
    intent ""
    domain_entity "city"
    named_entities "[&#34;city&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 547
    label "method.findAll(MethodCallExpr.class).forEach"
    node_type "function"
    function "forEach"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 548
    label "TimeLimiterConfig.custom().timeoutDuration"
    node_type "function"
    function "timeoutDuration"
    intent ""
    domain_entity "timeout"
    named_entities "[&#34;duration&#34;, &#34;timeout&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 549
    label "webClient.get().uri(vetsHostname + 'vets').retrieve"
    node_type "function"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 550
    label "org.springframework.samples.petclinic.visits.web.VisitResourceTest.given"
    node_type "function"
    function "given"
    intent "give"
    domain_entity ""
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 551
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.build"
    node_type "function"
    function "build"
    intent "build"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 552
    label "node.replace('\'', ''').replace('\n', ' ').replace('\r', ' ').replace('(', '(').replace(')', ')').trim"
    node_type "function"
    function "trim"
    intent "trim"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 553
    label "new Resilience4JConfigBuilder(id).circuitBreakerConfig(CircuitBreakerConfig.ofDefaults()).timeLimiterConfig"
    node_type "function"
    function "timeLimiterConfig"
    intent ""
    domain_entity "time"
    named_entities "[&#34;config&#34;, &#34;limiter&#34;, &#34;time&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 554
    label "org.springframework.samples.petclinic.genai.AIFunctionConfiguration"
    node_type "function"
    function "AIFunctionConfiguration"
    intent ""
    domain_entity "ai"
    named_entities "[&#34;ai&#34;, &#34;configuration&#34;, &#34;function&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 555
    label "org.springframework.samples.petclinic.discovery.DiscoveryServerApplicationTests"
    node_type "function"
    function "DiscoveryServerApplicationTests"
    intent ""
    domain_entity "discovery"
    named_entities "[&#34;application&#34;, &#34;discovery&#34;, &#34;server&#34;, &#34;tests&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 556
    label "consumer.accept"
    node_type "function"
    function "accept"
    intent "accept"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 557
    label "WebClient.builder"
    node_type "function"
    function "builder"
    intent ""
    domain_entity "builder"
    named_entities "[&#34;builder&#34;]"
    business_role "API Layer"
  ]
  node [
    id 558
    label "org.springframework.samples.petclinic.customers.model.Pet.getClass"
    node_type "function"
    function "getClass"
    intent "get"
    domain_entity "class"
    named_entities "[&#34;class&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 559
    label "org.springframework.samples.petclinic.genai.PetclinicChatClient.exchange"
    node_type "function"
    function "exchange"
    intent ""
    domain_entity "exchange"
    named_entities "[&#34;exchange&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 560
    label "request.vet"
    node_type "function"
    function "vet"
    intent ""
    domain_entity "vet"
    named_entities "[&#34;vet&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 561
    label "org.springframework.samples.petclinic.genai.AIBeanConfiguration"
    node_type "function"
    function "AIBeanConfiguration"
    intent ""
    domain_entity "ai"
    named_entities "[&#34;ai&#34;, &#34;bean&#34;, &#34;configuration&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 562
    label "org.springframework.samples.petclinic.customers.model.Pet.setName"
    node_type "function"
    function "setName"
    intent "set"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 563
    label "org.springframework.samples.petclinic.api.dto.OwnerDetailsBuilder.id"
    node_type "function"
    function "id"
    intent "d"
    domain_entity ""
    named_entities "[&#34;d&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 564
    label "webClient.get().uri(vetsHostname + 'vets').retrieve().bodyToMono(new ParameterizedTypeReference<List<Vet>>() {  }).block"
    node_type "function"
    function "block"
    intent ""
    domain_entity "block"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 565
    label "factory.configureDefault"
    node_type "function"
    function "configureDefault"
    intent ""
    domain_entity "configure"
    named_entities "[&#34;configure&#34;, &#34;default&#34;]"
    business_role "Configuration Layer"
  ]
  node [
    id 566
    label "Duration.ofSeconds"
    node_type "function"
    function "ofSeconds"
    intent ""
    domain_entity "second"
    named_entities "[&#34;second&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 567
    label "e.setAttribute"
    node_type "function"
    function "setAttribute"
    intent "set"
    domain_entity "attribute"
    named_entities "[&#34;attribute&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 568
    label "org.springframework.samples.petclinic.vets.model.Specialty"
    node_type "function"
    function "Specialty"
    intent ""
    domain_entity "specialty"
    named_entities "[&#34;specialty&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 569
    label "webClient.post().uri(ownersHostname + 'owners/' + request.ownerId() + '/pets').bodyValue(request.pet()).retrieve"
    node_type "function"
    function "retrieve"
    intent ""
    domain_entity "retrieve"
    named_entities "[]"
    business_role "API Layer"
  ]
  node [
    id 570
    label "org.springframework.samples.petclinic.genai.AIDataProvider.getAllOwners"
    node_type "function"
    function "getAllOwners"
    intent "get"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 571
    label "org.springframework.samples.petclinic.api.application.VisitsServiceClientIntegrationTest.assertNotNull"
    node_type "function"
    function "assertNotNull"
    intent "assert"
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 572
    label "Paths.get"
    node_type "function"
    function "get"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 573
    label "org.springframework.samples.petclinic.customers.web.OwnerResource.createOwner"
    node_type "function"
    function "createOwner"
    intent "create"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "API Layer"
  ]
  node [
    id 574
    label "client.get().uri('/api/gateway/owners/1').exchange"
    node_type "function"
    function "exchange"
    intent ""
    domain_entity "exchange"
    named_entities "[&#34;exchange&#34;]"
    business_role "Business Logic Layer"
  ]
  node [
    id 575
    label "topMatches.stream"
    node_type "function"
    function "stream"
    intent ""
    domain_entity "stream"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 576
    label "call.getNameAsString"
    node_type "function"
    function "getNameAsString"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;, &#34;string&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 577
    label "Document.getContent"
    node_type "function"
    function "getContent"
    intent "get"
    domain_entity "content"
    named_entities "[&#34;content&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 578
    label "org.springframework.samples.petclinic.api.boundary.web.ApiGatewayControllerTest.getOwnerDetails_withServiceError"
    node_type "function"
    function "getOwnerDetails_withServiceError"
    intent "get"
    domain_entity "owner"
    named_entities "[&#34;details&#34;, &#34;error&#34;, &#34;owner&#34;, &#34;service&#34;]"
    business_role "API Layer"
  ]
  node [
    id 579
    label "org.springframework.samples.petclinic.customers.model.Owner.getLastName"
    node_type "function"
    function "getLastName"
    intent "get"
    domain_entity "name"
    named_entities "[&#34;name&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 580
    label "visits.block"
    node_type "function"
    function "block"
    intent ""
    domain_entity "block"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 581
    label "org.springframework.samples.petclinic.customers.web.OwnerResource"
    node_type "function"
    function "OwnerResource"
    intent ""
    domain_entity "owner"
    named_entities "[&#34;owner&#34;, &#34;resource&#34;]"
    business_role "API Layer"
  ]
  node [
    id 582
    label "mvc.perform(get('/pets/visits?petId=111,222')).andExpect"
    node_type "function"
    function "andExpect"
    intent "expect"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 583
    label "client.get().uri('/api/gateway/owners/1').exchange().expectStatus().isOk"
    node_type "function"
    function "isOk"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Business Logic Layer"
  ]
  node [
    id 584
    label "org.springframework.samples.petclinic.vets.web.VetResource.showResourcesVetList"
    node_type "function"
    function "showResourcesVetList"
    intent "show"
    domain_entity "resources"
    named_entities "[&#34;list&#34;, &#34;resources&#34;, &#34;vet&#34;]"
    business_role "API Layer"
  ]
  node [
    id 585
    label "this.getId"
    node_type "function"
    function "getId"
    intent "get"
    domain_entity "i"
    named_entities "[&#34;d&#34;, &#34;i&#34;]"
    business_role "Domain Logic"
  ]
  node [
    id 586
    label "Files.walk"
    node_type "function"
    function "walk"
    intent "walk"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 587
    label "RequestPredicates.GET"
    node_type "function"
    function "GET"
    intent "get"
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 588
    label "vetRepository.findAll"
    node_type "function"
    function "findAll"
    intent "find"
    domain_entity ""
    named_entities "[]"
    business_role "Data Access Layer"
  ]
  node [
    id 589
    label "org.springframework.samples.petclinic.visits.web.VisitResource"
    node_type "function"
    function "VisitResource"
    intent "visit"
    domain_entity "resource"
    named_entities "[&#34;resource&#34;]"
    business_role "API Layer"
  ]
  node [
    id 590
    label "org.springframework.samples.petclinic.visits.model.Visit.setDescription"
    node_type "function"
    function "setDescription"
    intent "set"
    domain_entity "description"
    named_entities "[&#34;description&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 591
    label "call.getScope().map(s -> s.toString() + '.' + call.getNameAsString()).orElse"
    node_type "function"
    function "orElse"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 592
    label "org.springframework.samples.petclinic.vets.web.VetResourceTest"
    node_type "function"
    function "VetResourceTest"
    intent ""
    domain_entity "vet"
    named_entities "[&#34;resource&#34;, &#34;test&#34;, &#34;vet&#34;]"
    business_role "API Layer"
  ]
  node [
    id 593
    label "org.springframework.samples.petclinic.customers.web.OwnerResource.findOwner"
    node_type "function"
    function "findOwner"
    intent "find"
    domain_entity "owner"
    named_entities "[&#34;owner&#34;]"
    business_role "API Layer"
  ]
  node [
    id 594
    label "call.getScope().map"
    node_type "function"
    function "map"
    intent ""
    domain_entity "map"
    named_entities "[]"
    business_role "Domain Logic"
  ]
  node [
    id 595
    label "org.springframework.samples.petclinic.vets.model.Vet.addSpecialty"
    node_type "function"
    function "addSpecialty"
    intent "add"
    domain_entity "specialty"
    named_entities "[&#34;specialty&#34;]"
    business_role "Domain Model"
  ]
  node [
    id 596
    label "visitRepository.save"
    node_type "function"
    function "save"
    intent "save"
    domain_entity ""
    named_entities "[]"
    business_role "Data Access Layer"
  ]
  node [
    id 597
    label "first"
    node_type "domain_entity"
  ]
  node [
    id 598
    label "set"
    node_type "action"
  ]
  node [
    id 599
    label "visit"
    node_type "action"
  ]
  node [
    id 600
    label "pet"
    node_type "domain_entity"
  ]
  node [
    id 601
    label "add"
    node_type "action"
  ]
  node [
    id 602
    label "list"
    node_type "domain_entity"
  ]
  node [
    id 603
    label "map"
    node_type "domain_entity"
  ]
  node [
    id 604
    label "join"
    node_type "action"
  ]
  node [
    id 605
    label "find"
    node_type "action"
  ]
  node [
    id 606
    label "create"
    node_type "action"
  ]
  node [
    id 607
    label "repo"
    node_type "domain_entity"
  ]
  node [
    id 608
    label "json"
    node_type "domain_entity"
  ]
  node [
    id 609
    label "export"
    node_type "domain_entity"
  ]
  node [
    id 610
    label "balanced"
    node_type "domain_entity"
  ]
  node [
    id 611
    label "load"
    node_type "domain_entity"
  ]
  node [
    id 612
    label "scope"
    node_type "domain_entity"
  ]
  node [
    id 613
    label "get"
    node_type "action"
  ]
  node [
    id 614
    label "message"
    node_type "domain_entity"
  ]
  node [
    id 615
    label "body"
    node_type "domain_entity"
  ]
  node [
    id 616
    label "singleton"
    node_type "domain_entity"
  ]
  node [
    id 617
    label "type"
    node_type "domain_entity"
  ]
  node [
    id 618
    label "child"
    node_type "domain_entity"
  ]
  node [
    id 619
    label "append"
    node_type "action"
  ]
  node [
    id 620
    label "size"
    node_type "domain_entity"
  ]
  node [
    id 621
    label "telephone"
    node_type "domain_entity"
  ]
  node [
    id 622
    label "metric"
    node_type "domain_entity"
  ]
  node [
    id 623
    label "i"
    node_type "domain_entity"
  ]
  node [
    id 624
    label "attribute"
    node_type "domain_entity"
  ]
  node [
    id 625
    label "birth"
    node_type "domain_entity"
  ]
  node [
    id 626
    label "spring"
    node_type "domain_entity"
  ]
  node [
    id 627
    label "name"
    node_type "domain_entity"
  ]
  node [
    id 628
    label "equal"
    node_type "action"
  ]
  node [
    id 629
    label "owner"
    node_type "domain_entity"
  ]
  node [
    id 630
    label "vets"
    node_type "domain_entity"
  ]
  node [
    id 631
    label "d"
    node_type "action"
  ]
  node [
    id 632
    label "circuit"
    node_type "domain_entity"
  ]
  node [
    id 633
    label "resource"
    node_type "domain_entity"
  ]
  node [
    id 634
    label "error"
    node_type "domain_entity"
  ]
  node [
    id 635
    label "city"
    node_type "domain_entity"
  ]
  node [
    id 636
    label "info"
    node_type "domain_entity"
  ]
  node [
    id 637
    label "give"
    node_type "action"
  ]
  node [
    id 638
    label "content"
    node_type "domain_entity"
  ]
  node [
    id 639
    label "date"
    node_type "domain_entity"
  ]
  node [
    id 640
    label "entry"
    node_type "domain_entity"
  ]
  node [
    id 641
    label "new"
    node_type "domain_entity"
  ]
  node [
    id 642
    label "string"
    node_type "domain_entity"
  ]
  node [
    id 643
    label "uri"
    node_type "domain_entity"
  ]
  node [
    id 644
    label "vet"
    node_type "domain_entity"
  ]
  node [
    id 645
    label "expect"
    node_type "action"
  ]
  node [
    id 646
    label "vector"
    node_type "domain_entity"
  ]
  node [
    id 647
    label "package"
    node_type "domain_entity"
  ]
  node [
    id 648
    label "cache"
    node_type "domain_entity"
  ]
  node [
    id 649
    label "build"
    node_type "action"
  ]
  node [
    id 650
    label "write"
    node_type "action"
  ]
  node [
    id 651
    label "similarity"
    node_type "domain_entity"
  ]
  node [
    id 652
    label "replace"
    node_type "action"
  ]
  node [
    id 653
    label "return"
    node_type "action"
  ]
  node [
    id 654
    label "println"
    node_type "domain_entity"
  ]
  node [
    id 655
    label "block"
    node_type "domain_entity"
  ]
  node [
    id 656
    label "custom"
    node_type "domain_entity"
  ]
  node [
    id 657
    label "parse"
    node_type "domain_entity"
  ]
  node [
    id 658
    label "default"
    node_type "domain_entity"
  ]
  node [
    id 659
    label "convert"
    node_type "action"
  ]
  node [
    id 660
    label "discovery"
    node_type "domain_entity"
  ]
  node [
    id 661
    label "aspect"
    node_type "domain_entity"
  ]
  node [
    id 662
    label "time"
    node_type "domain_entity"
  ]
  node [
    id 663
    label "transform"
    node_type "action"
  ]
  node [
    id 664
    label "post"
    node_type "action"
  ]
  node [
    id 665
    label "hostname"
    node_type "domain_entity"
  ]
  node [
    id 666
    label "status"
    node_type "domain_entity"
  ]
  node [
    id 667
    label "call"
    node_type "action"
  ]
  node [
    id 668
    label "retrieve"
    node_type "domain_entity"
  ]
  node [
    id 669
    label "put"
    node_type "action"
  ]
  node [
    id 670
    label "customers"
    node_type "domain_entity"
  ]
  node [
    id 671
    label "text"
    node_type "domain_entity"
  ]
  node [
    id 672
    label "equals"
    node_type "domain_entity"
  ]
  node [
    id 673
    label "assert"
    node_type "action"
  ]
  node [
    id 674
    label "context"
    node_type "domain_entity"
  ]
  node [
    id 675
    label "save"
    node_type "action"
  ]
  node [
    id 676
    label "else"
    node_type "domain_entity"
  ]
  node [
    id 677
    label "filter"
    node_type "action"
  ]
  node [
    id 678
    label "accept"
    node_type "action"
  ]
  node [
    id 679
    label "shutdown"
    node_type "domain_entity"
  ]
  node [
    id 680
    label "value"
    node_type "domain_entity"
  ]
  node [
    id 681
    label "address"
    node_type "domain_entity"
  ]
  node [
    id 682
    label "exist"
    node_type "action"
  ]
  node [
    id 683
    label "collect"
    node_type "action"
  ]
  node [
    id 684
    label "identifier"
    node_type "domain_entity"
  ]
  node [
    id 685
    label "configuration"
    node_type "domain_entity"
  ]
  node [
    id 686
    label "process"
    node_type "domain_entity"
  ]
  node [
    id 687
    label "element"
    node_type "domain_entity"
  ]
  node [
    id 688
    label "semantic"
    node_type "domain_entity"
  ]
  node [
    id 689
    label "parameter"
    node_type "domain_entity"
  ]
  node [
    id 690
    label "resilience"
    node_type "domain_entity"
  ]
  node [
    id 691
    label "config"
    node_type "domain_entity"
  ]
  node [
    id 692
    label "router"
    node_type "domain_entity"
  ]
  node [
    id 693
    label "key"
    node_type "domain_entity"
  ]
  node [
    id 694
    label "contain"
    node_type "action"
  ]
  node [
    id 695
    label "ai"
    node_type "domain_entity"
  ]
  node [
    id 696
    label "k"
    node_type "domain_entity"
  ]
  node [
    id 697
    label "read"
    node_type "action"
  ]
  node [
    id 698
    label "query"
    node_type "domain_entity"
  ]
  node [
    id 699
    label "stream"
    node_type "domain_entity"
  ]
  node [
    id 700
    label "visits"
    node_type "domain_entity"
  ]
  node [
    id 701
    label "reduce"
    node_type "action"
  ]
  node [
    id 702
    label "response"
    node_type "domain_entity"
  ]
  node [
    id 703
    label "prepare"
    node_type "action"
  ]
  node [
    id 704
    label "builder"
    node_type "domain_entity"
  ]
  node [
    id 705
    label "absent"
    node_type "domain_entity"
  ]
  node [
    id 706
    label "hash"
    node_type "action"
  ]
  node [
    id 707
    label "fallback"
    node_type "domain_entity"
  ]
  node [
    id 708
    label "run"
    node_type "action"
  ]
  node [
    id 709
    label "end"
    node_type "action"
  ]
  node [
    id 710
    label "class"
    node_type "domain_entity"
  ]
  node [
    id 711
    label "description"
    node_type "domain_entity"
  ]
  node [
    id 712
    label "nr"
    node_type "domain_entity"
  ]
  node [
    id 713
    label "setup"
    node_type "domain_entity"
  ]
  node [
    id 714
    label "output"
    node_type "domain_entity"
  ]
  node [
    id 715
    label "trim"
    node_type "action"
  ]
  node [
    id 716
    label "item"
    node_type "domain_entity"
  ]
  node [
    id 717
    label "mkdir"
    node_type "domain_entity"
  ]
  node [
    id 718
    label "user"
    node_type "domain_entity"
  ]
  node [
    id 719
    label "enqueue"
    node_type "domain_entity"
  ]
  node [
    id 720
    label "gen"
    node_type "domain_entity"
  ]
  node [
    id 721
    label "api"
    node_type "domain_entity"
  ]
  node [
    id 722
    label "specialty"
    node_type "domain_entity"
  ]
  node [
    id 723
    label "byte"
    node_type "domain_entity"
  ]
  node [
    id 724
    label "repository"
    node_type "domain_entity"
  ]
  node [
    id 725
    label "import"
    node_type "domain_entity"
  ]
  node [
    id 726
    label "fetch"
    node_type "action"
  ]
  node [
    id 727
    label "file"
    node_type "action"
  ]
  node [
    id 728
    label "route"
    node_type "domain_entity"
  ]
  node [
    id 729
    label "ids"
    node_type "domain_entity"
  ]
  node [
    id 730
    label "sort"
    node_type "domain_entity"
  ]
  node [
    id 731
    label "temp"
    node_type "domain_entity"
  ]
  node [
    id 732
    label "petclinic"
    node_type "domain_entity"
  ]
  node [
    id 733
    label "code"
    node_type "domain_entity"
  ]
  node [
    id 734
    label "pets"
    node_type "domain_entity"
  ]
  node [
    id 735
    label "tags"
    node_type "domain_entity"
  ]
  node [
    id 736
    label "perform"
    node_type "action"
  ]
  node [
    id 737
    label "language"
    node_type "domain_entity"
  ]
  node [
    id 738
    label "absolute"
    node_type "domain_entity"
  ]
  node [
    id 739
    label "update"
    node_type "domain_entity"
  ]
  node [
    id 740
    label "url"
    node_type "domain_entity"
  ]
  node [
    id 741
    label "test"
    node_type "action"
  ]
  node [
    id 742
    label "specialties"
    node_type "domain_entity"
  ]
  node [
    id 743
    label "header"
    node_type "domain_entity"
  ]
  node [
    id 744
    label "chat"
    node_type "domain_entity"
  ]
  node [
    id 745
    label "timeout"
    node_type "domain_entity"
  ]
  node [
    id 746
    label "exchange"
    node_type "domain_entity"
  ]
  node [
    id 747
    label "configure"
    node_type "domain_entity"
  ]
  node [
    id 748
    label "second"
    node_type "domain_entity"
  ]
  node [
    id 749
    label "resources"
    node_type "domain_entity"
  ]
  node [
    id 750
    label "show"
    node_type "action"
  ]
  node [
    id 751
    label "walk"
    node_type "action"
  ]
  edge [
    source 0
    target 597
    relation "RELATES_TO"
  ]
  edge [
    source 0
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 1
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 2
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 2
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 3
    target 516
  ]
  edge [
    source 3
    target 602
    relation "RELATES_TO"
  ]
  edge [
    source 4
    target 603
    relation "RELATES_TO"
  ]
  edge [
    source 5
    target 604
    relation "PERFORMS"
  ]
  edge [
    source 6
    target 469
  ]
  edge [
    source 6
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 6
    target 605
    relation "PERFORMS"
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
    source 7
    target 606
    relation "PERFORMS"
  ]
  edge [
    source 8
    target 607
    relation "RELATES_TO"
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
    source 9
    target 608
    relation "RELATES_TO"
  ]
  edge [
    source 9
    target 609
    relation "PERFORMS"
  ]
  edge [
    source 10
    target 557
  ]
  edge [
    source 10
    target 610
    relation "RELATES_TO"
  ]
  edge [
    source 10
    target 611
    relation "PERFORMS"
  ]
  edge [
    source 11
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 12
    target 612
    relation "RELATES_TO"
  ]
  edge [
    source 12
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 13
    target 614
    relation "RELATES_TO"
  ]
  edge [
    source 13
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 14
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 15
    target 616
    relation "RELATES_TO"
  ]
  edge [
    source 16
    target 617
    relation "RELATES_TO"
  ]
  edge [
    source 16
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 17
    target 618
    relation "RELATES_TO"
  ]
  edge [
    source 17
    target 619
    relation "PERFORMS"
  ]
  edge [
    source 18
    target 620
    relation "RELATES_TO"
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
    source 19
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 19
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 20
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 20
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 21
    target 621
    relation "RELATES_TO"
  ]
  edge [
    source 21
    target 598
    relation "PERFORMS"
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
    source 22
    target 622
    relation "RELATES_TO"
  ]
  edge [
    source 23
    target 623
    relation "RELATES_TO"
  ]
  edge [
    source 23
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 24
    target 624
    relation "RELATES_TO"
  ]
  edge [
    source 24
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 25
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 25
    target 613
    relation "PERFORMS"
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
    source 26
    target 603
    relation "RELATES_TO"
  ]
  edge [
    source 27
    target 625
    relation "RELATES_TO"
  ]
  edge [
    source 27
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 28
    target 626
    relation "RELATES_TO"
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
    source 29
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 29
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 30
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 30
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 31
    target 627
    relation "RELATES_TO"
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
    source 32
    target 628
    relation "PERFORMS"
  ]
  edge [
    source 33
    target 617
    relation "RELATES_TO"
  ]
  edge [
    source 33
    target 598
    relation "PERFORMS"
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
    source 34
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 34
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 35
    target 630
    relation "RELATES_TO"
  ]
  edge [
    source 36
    target 603
    relation "RELATES_TO"
  ]
  edge [
    source 37
    target 631
    relation "RELATES_TO"
  ]
  edge [
    source 37
    target 598
    relation "PERFORMS"
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
    source 38
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 39
    target 96
  ]
  edge [
    source 39
    target 632
    relation "RELATES_TO"
  ]
  edge [
    source 40
    target 631
    relation "PERFORMS"
  ]
  edge [
    source 41
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 43
    target 633
    relation "RELATES_TO"
  ]
  edge [
    source 43
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 44
    target 631
    relation "PERFORMS"
  ]
  edge [
    source 45
    target 602
    relation "RELATES_TO"
  ]
  edge [
    source 46
    target 634
    relation "RELATES_TO"
  ]
  edge [
    source 47
    target 635
    relation "RELATES_TO"
  ]
  edge [
    source 47
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 48
    target 636
    relation "RELATES_TO"
  ]
  edge [
    source 49
    target 637
    relation "PERFORMS"
  ]
  edge [
    source 50
    target 296
  ]
  edge [
    source 50
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 50
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 51
    target 638
    relation "RELATES_TO"
  ]
  edge [
    source 52
    target 639
    relation "RELATES_TO"
  ]
  edge [
    source 53
    target 640
    relation "RELATES_TO"
  ]
  edge [
    source 54
    target 602
    relation "RELATES_TO"
  ]
  edge [
    source 55
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 56
    target 641
    relation "RELATES_TO"
  ]
  edge [
    source 57
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 58
    target 643
    relation "RELATES_TO"
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
    source 59
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 59
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 60
    target 635
    relation "RELATES_TO"
  ]
  edge [
    source 60
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 61
    target 608
    relation "RELATES_TO"
  ]
  edge [
    source 62
    target 641
    relation "RELATES_TO"
  ]
  edge [
    source 63
    target 644
    relation "RELATES_TO"
  ]
  edge [
    source 64
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 65
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 66
    target 635
    relation "RELATES_TO"
  ]
  edge [
    source 66
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 67
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 68
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 69
    target 646
    relation "RELATES_TO"
  ]
  edge [
    source 70
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 71
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 72
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 73
    target 647
    relation "RELATES_TO"
  ]
  edge [
    source 73
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 74
    target 619
    relation "RELATES_TO"
  ]
  edge [
    source 75
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 76
    target 648
    relation "RELATES_TO"
  ]
  edge [
    source 77
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 78
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 79
    target 650
    relation "PERFORMS"
  ]
  edge [
    source 80
    target 625
    relation "RELATES_TO"
  ]
  edge [
    source 82
    target 631
    relation "RELATES_TO"
  ]
  edge [
    source 82
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 83
    target 651
    relation "RELATES_TO"
  ]
  edge [
    source 84
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 84
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 85
    target 652
    relation "PERFORMS"
  ]
  edge [
    source 88
    target 653
    relation "PERFORMS"
  ]
  edge [
    source 89
    target 654
    relation "RELATES_TO"
  ]
  edge [
    source 90
    target 618
    relation "RELATES_TO"
  ]
  edge [
    source 90
    target 619
    relation "PERFORMS"
  ]
  edge [
    source 91
    target 655
    relation "RELATES_TO"
  ]
  edge [
    source 92
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 93
    target 656
    relation "RELATES_TO"
  ]
  edge [
    source 94
    target 657
    relation "PERFORMS"
  ]
  edge [
    source 95
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 96
    target 658
    relation "RELATES_TO"
  ]
  edge [
    source 97
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 98
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 99
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 100
    target 633
    relation "RELATES_TO"
  ]
  edge [
    source 101
    target 631
    relation "PERFORMS"
  ]
  edge [
    source 102
    target 601
    relation "PERFORMS"
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
    source 103
    target 602
    relation "RELATES_TO"
  ]
  edge [
    source 103
    target 659
    relation "PERFORMS"
  ]
  edge [
    source 104
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 105
    target 660
    relation "RELATES_TO"
  ]
  edge [
    source 106
    target 617
    relation "RELATES_TO"
  ]
  edge [
    source 106
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 107
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 108
    target 624
    relation "RELATES_TO"
  ]
  edge [
    source 108
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 109
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 110
    target 661
    relation "RELATES_TO"
  ]
  edge [
    source 110
    target 662
    relation "PERFORMS"
  ]
  edge [
    source 111
    target 663
    relation "PERFORMS"
  ]
  edge [
    source 112
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 112
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 113
    target 664
    relation "PERFORMS"
  ]
  edge [
    source 114
    target 619
    relation "RELATES_TO"
  ]
  edge [
    source 115
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 116
    target 665
    relation "RELATES_TO"
  ]
  edge [
    source 116
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 117
    target 641
    relation "RELATES_TO"
  ]
  edge [
    source 118
    target 666
    relation "RELATES_TO"
  ]
  edge [
    source 118
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 119
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 119
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 120
    target 667
    relation "PERFORMS"
  ]
  edge [
    source 121
    target 668
    relation "RELATES_TO"
  ]
  edge [
    source 122
    target 669
    relation "PERFORMS"
  ]
  edge [
    source 123
    target 623
    relation "RELATES_TO"
  ]
  edge [
    source 123
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 124
    target 645
    relation "PERFORMS"
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
    source 125
    target 611
    relation "RELATES_TO"
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
    source 126
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 126
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 127
    target 666
    relation "RELATES_TO"
  ]
  edge [
    source 128
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 129
    target 628
    relation "PERFORMS"
  ]
  edge [
    source 130
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 131
    target 670
    relation "RELATES_TO"
  ]
  edge [
    source 132
    target 622
    relation "RELATES_TO"
  ]
  edge [
    source 133
    target 279
  ]
  edge [
    source 134
    target 671
    relation "RELATES_TO"
  ]
  edge [
    source 134
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 135
    target 672
    relation "RELATES_TO"
  ]
  edge [
    source 135
    target 673
    relation "PERFORMS"
  ]
  edge [
    source 136
    target 674
    relation "RELATES_TO"
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
    source 137
    target 657
    relation "RELATES_TO"
  ]
  edge [
    source 139
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 139
    target 598
    relation "PERFORMS"
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
    source 140
    target 675
    relation "PERFORMS"
  ]
  edge [
    source 141
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 142
    target 676
    relation "RELATES_TO"
  ]
  edge [
    source 143
    target 597
    relation "RELATES_TO"
  ]
  edge [
    source 143
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 144
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 144
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 145
    target 598
    relation "RELATES_TO"
  ]
  edge [
    source 146
    target 677
    relation "PERFORMS"
  ]
  edge [
    source 147
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 147
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 148
    target 678
    relation "PERFORMS"
  ]
  edge [
    source 149
    target 679
    relation "RELATES_TO"
  ]
  edge [
    source 150
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 151
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 151
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 152
    target 279
  ]
  edge [
    source 153
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 154
    target 681
    relation "RELATES_TO"
  ]
  edge [
    source 155
    target 643
    relation "RELATES_TO"
  ]
  edge [
    source 156
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 157
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 158
    target 606
    relation "PERFORMS"
  ]
  edge [
    source 159
    target 608
    relation "RELATES_TO"
  ]
  edge [
    source 160
    target 682
    relation "PERFORMS"
  ]
  edge [
    source 161
    target 597
    relation "RELATES_TO"
  ]
  edge [
    source 162
    target 681
    relation "RELATES_TO"
  ]
  edge [
    source 162
    target 598
    relation "PERFORMS"
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
    source 163
    target 602
    relation "RELATES_TO"
  ]
  edge [
    source 164
    target 683
    relation "PERFORMS"
  ]
  edge [
    source 165
    target 631
    relation "PERFORMS"
  ]
  edge [
    source 166
    target 631
    relation "RELATES_TO"
  ]
  edge [
    source 166
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 168
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 169
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 170
    target 666
    relation "RELATES_TO"
  ]
  edge [
    source 171
    target 684
    relation "RELATES_TO"
  ]
  edge [
    source 171
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 172
    target 685
    relation "RELATES_TO"
  ]
  edge [
    source 172
    target 598
    relation "PERFORMS"
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
    source 173
    target 686
    relation "RELATES_TO"
  ]
  edge [
    source 174
    target 687
    relation "RELATES_TO"
  ]
  edge [
    source 174
    target 606
    relation "PERFORMS"
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
    source 175
    target 688
    relation "RELATES_TO"
  ]
  edge [
    source 175
    target 609
    relation "PERFORMS"
  ]
  edge [
    source 176
    target 635
    relation "RELATES_TO"
  ]
  edge [
    source 177
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 178
    target 689
    relation "RELATES_TO"
  ]
  edge [
    source 178
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 179
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 180
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 181
    target 690
    relation "RELATES_TO"
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
    source 182
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 182
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 183
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 184
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 184
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 185
    target 691
    relation "RELATES_TO"
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
    source 187
    target 692
    relation "RELATES_TO"
  ]
  edge [
    source 188
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 189
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 190
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 191
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 191
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 192
    target 693
    relation "RELATES_TO"
  ]
  edge [
    source 192
    target 694
    relation "PERFORMS"
  ]
  edge [
    source 194
    target 639
    relation "RELATES_TO"
  ]
  edge [
    source 194
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 195
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 196
    target 639
    relation "RELATES_TO"
  ]
  edge [
    source 196
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 197
    target 623
    relation "RELATES_TO"
  ]
  edge [
    source 197
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 198
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 199
    target 618
    relation "RELATES_TO"
  ]
  edge [
    source 199
    target 619
    relation "PERFORMS"
  ]
  edge [
    source 200
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 201
    target 653
    relation "PERFORMS"
  ]
  edge [
    source 202
    target 625
    relation "RELATES_TO"
  ]
  edge [
    source 202
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 203
    target 631
    relation "RELATES_TO"
  ]
  edge [
    source 203
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 204
    target 671
    relation "RELATES_TO"
  ]
  edge [
    source 205
    target 695
    relation "RELATES_TO"
  ]
  edge [
    source 206
    target 557
  ]
  edge [
    source 206
    target 610
    relation "RELATES_TO"
  ]
  edge [
    source 206
    target 611
    relation "PERFORMS"
  ]
  edge [
    source 207
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 208
    target 632
    relation "RELATES_TO"
  ]
  edge [
    source 209
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 210
    target 279
  ]
  edge [
    source 211
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 212
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 213
    target 279
  ]
  edge [
    source 214
    target 638
    relation "RELATES_TO"
  ]
  edge [
    source 215
    target 696
    relation "RELATES_TO"
  ]
  edge [
    source 216
    target 639
    relation "RELATES_TO"
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
    source 217
    target 697
    relation "PERFORMS"
  ]
  edge [
    source 218
    target 603
    relation "RELATES_TO"
  ]
  edge [
    source 219
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 220
    target 698
    relation "RELATES_TO"
  ]
  edge [
    source 221
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 222
    target 623
    relation "RELATES_TO"
  ]
  edge [
    source 222
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 223
    target 668
    relation "RELATES_TO"
  ]
  edge [
    source 224
    target 597
    relation "RELATES_TO"
  ]
  edge [
    source 224
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 225
    target 699
    relation "RELATES_TO"
  ]
  edge [
    source 227
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 228
    target 612
    relation "RELATES_TO"
  ]
  edge [
    source 228
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 230
    target 700
    relation "RELATES_TO"
  ]
  edge [
    source 231
    target 669
    relation "PERFORMS"
  ]
  edge [
    source 232
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 232
    target 605
    relation "PERFORMS"
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
    source 234
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 234
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 235
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 236
    target 629
    relation "RELATES_TO"
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
    source 237
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 239
    target 597
    relation "RELATES_TO"
  ]
  edge [
    source 239
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 240
    target 669
    relation "PERFORMS"
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
    source 241
    target 649
    relation "PERFORMS"
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
    source 242
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 242
    target 673
    relation "PERFORMS"
  ]
  edge [
    source 243
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 243
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 244
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 244
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 245
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 246
    target 636
    relation "RELATES_TO"
  ]
  edge [
    source 247
    target 655
    relation "RELATES_TO"
  ]
  edge [
    source 248
    target 684
    relation "RELATES_TO"
  ]
  edge [
    source 248
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 249
    target 634
    relation "RELATES_TO"
  ]
  edge [
    source 250
    target 701
    relation "PERFORMS"
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
    source 251
    target 702
    relation "RELATES_TO"
  ]
  edge [
    source 251
    target 703
    relation "PERFORMS"
  ]
  edge [
    source 252
    target 631
    relation "PERFORMS"
  ]
  edge [
    source 253
    target 699
    relation "RELATES_TO"
  ]
  edge [
    source 254
    target 704
    relation "RELATES_TO"
  ]
  edge [
    source 254
    target 599
    relation "PERFORMS"
  ]
  edge [
    source 255
    target 597
    relation "RELATES_TO"
  ]
  edge [
    source 255
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 256
    target 623
    relation "RELATES_TO"
  ]
  edge [
    source 256
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 257
    target 617
    relation "RELATES_TO"
  ]
  edge [
    source 258
    target 631
    relation "RELATES_TO"
  ]
  edge [
    source 258
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 259
    target 705
    relation "RELATES_TO"
  ]
  edge [
    source 260
    target 624
    relation "RELATES_TO"
  ]
  edge [
    source 260
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 261
    target 675
    relation "PERFORMS"
  ]
  edge [
    source 262
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 263
    target 669
    relation "PERFORMS"
  ]
  edge [
    source 264
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 265
    target 601
    relation "PERFORMS"
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
    source 266
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 266
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 267
    target 149
  ]
  edge [
    source 267
    target 679
    relation "RELATES_TO"
  ]
  edge [
    source 268
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 268
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 269
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 269
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 270
    target 699
    relation "RELATES_TO"
  ]
  edge [
    source 272
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 272
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 273
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 274
    target 619
    relation "RELATES_TO"
  ]
  edge [
    source 275
    target 706
    relation "RELATES_TO"
  ]
  edge [
    source 276
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 277
    target 612
    relation "RELATES_TO"
  ]
  edge [
    source 277
    target 613
    relation "PERFORMS"
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
    source 278
    target 707
    relation "RELATES_TO"
  ]
  edge [
    source 279
    target 708
    relation "PERFORMS"
  ]
  edge [
    source 280
    target 602
    relation "RELATES_TO"
  ]
  edge [
    source 281
    target 669
    relation "PERFORMS"
  ]
  edge [
    source 283
    target 634
    relation "RELATES_TO"
  ]
  edge [
    source 284
    target 629
    relation "RELATES_TO"
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
    source 285
    target 686
    relation "RELATES_TO"
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
    source 286
    target 658
    relation "RELATES_TO"
  ]
  edge [
    source 287
    target 709
    relation "PERFORMS"
  ]
  edge [
    source 288
    target 710
    relation "RELATES_TO"
  ]
  edge [
    source 288
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 289
    target 623
    relation "RELATES_TO"
  ]
  edge [
    source 289
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 290
    target 653
    relation "PERFORMS"
  ]
  edge [
    source 291
    target 675
    relation "PERFORMS"
  ]
  edge [
    source 292
    target 681
    relation "RELATES_TO"
  ]
  edge [
    source 292
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 293
    target 691
    relation "RELATES_TO"
  ]
  edge [
    source 294
    target 623
    relation "RELATES_TO"
  ]
  edge [
    source 294
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 295
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 296
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 296
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 297
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 298
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 299
    target 708
    relation "PERFORMS"
  ]
  edge [
    source 300
    target 619
    relation "RELATES_TO"
  ]
  edge [
    source 301
    target 608
    relation "RELATES_TO"
  ]
  edge [
    source 302
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 302
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 303
    target 654
    relation "RELATES_TO"
  ]
  edge [
    source 305
    target 643
    relation "RELATES_TO"
  ]
  edge [
    source 306
    target 674
    relation "RELATES_TO"
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
    source 307
    target 622
    relation "RELATES_TO"
  ]
  edge [
    source 308
    target 669
    relation "PERFORMS"
  ]
  edge [
    source 309
    target 619
    relation "RELATES_TO"
  ]
  edge [
    source 310
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 311
    target 641
    relation "RELATES_TO"
  ]
  edge [
    source 312
    target 711
    relation "RELATES_TO"
  ]
  edge [
    source 312
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 313
    target 652
    relation "PERFORMS"
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
    source 314
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 314
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 315
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 316
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 316
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 317
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 317
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 318
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 320
    target 619
    relation "RELATES_TO"
  ]
  edge [
    source 321
    target 665
    relation "RELATES_TO"
  ]
  edge [
    source 321
    target 598
    relation "PERFORMS"
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
    source 322
    target 602
    relation "RELATES_TO"
  ]
  edge [
    source 322
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 323
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 324
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 325
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 326
    target 603
    relation "RELATES_TO"
  ]
  edge [
    source 327
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 328
    target 675
    relation "PERFORMS"
  ]
  edge [
    source 329
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 329
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 330
    target 619
    relation "RELATES_TO"
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
    source 332
    target 712
    relation "RELATES_TO"
  ]
  edge [
    source 332
    target 613
    relation "PERFORMS"
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
    source 333
    target 713
    relation "RELATES_TO"
  ]
  edge [
    source 334
    target 632
    relation "RELATES_TO"
  ]
  edge [
    source 335
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 336
    target 597
    relation "RELATES_TO"
  ]
  edge [
    source 337
    target 714
    relation "RELATES_TO"
  ]
  edge [
    source 337
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 338
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 338
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 339
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 340
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 340
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 341
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 343
    target 668
    relation "RELATES_TO"
  ]
  edge [
    source 344
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 344
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 345
    target 638
    relation "RELATES_TO"
  ]
  edge [
    source 346
    target 608
    relation "RELATES_TO"
  ]
  edge [
    source 347
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 348
    target 715
    relation "PERFORMS"
  ]
  edge [
    source 350
    target 716
    relation "RELATES_TO"
  ]
  edge [
    source 351
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 352
    target 717
    relation "RELATES_TO"
  ]
  edge [
    source 353
    target 718
    relation "RELATES_TO"
  ]
  edge [
    source 354
    target 631
    relation "RELATES_TO"
  ]
  edge [
    source 354
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 355
    target 617
    relation "RELATES_TO"
  ]
  edge [
    source 355
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 356
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 357
    target 658
    relation "RELATES_TO"
  ]
  edge [
    source 358
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 359
    target 719
    relation "RELATES_TO"
  ]
  edge [
    source 360
    target 652
    relation "PERFORMS"
  ]
  edge [
    source 361
    target 674
    relation "RELATES_TO"
  ]
  edge [
    source 362
    target 652
    relation "PERFORMS"
  ]
  edge [
    source 363
    target 658
    relation "RELATES_TO"
  ]
  edge [
    source 364
    target 620
    relation "RELATES_TO"
  ]
  edge [
    source 365
    target 646
    relation "RELATES_TO"
  ]
  edge [
    source 366
    target 644
    relation "RELATES_TO"
  ]
  edge [
    source 367
    target 720
    relation "RELATES_TO"
  ]
  edge [
    source 368
    target 676
    relation "RELATES_TO"
  ]
  edge [
    source 369
    target 610
    relation "RELATES_TO"
  ]
  edge [
    source 369
    target 611
    relation "PERFORMS"
  ]
  edge [
    source 370
    target 603
    relation "RELATES_TO"
  ]
  edge [
    source 371
    target 721
    relation "RELATES_TO"
  ]
  edge [
    source 372
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 373
    target 658
    relation "RELATES_TO"
  ]
  edge [
    source 374
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 375
    target 637
    relation "PERFORMS"
  ]
  edge [
    source 376
    target 597
    relation "RELATES_TO"
  ]
  edge [
    source 376
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 377
    target 711
    relation "RELATES_TO"
  ]
  edge [
    source 377
    target 598
    relation "PERFORMS"
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
    source 380
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 380
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 381
    target 633
    relation "RELATES_TO"
  ]
  edge [
    source 381
    target 599
    relation "PERFORMS"
  ]
  edge [
    source 382
    target 631
    relation "PERFORMS"
  ]
  edge [
    source 383
    target 619
    relation "RELATES_TO"
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
    source 384
    target 722
    relation "RELATES_TO"
  ]
  edge [
    source 384
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 385
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 385
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 386
    target 617
    relation "RELATES_TO"
  ]
  edge [
    source 386
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 387
    target 2
  ]
  edge [
    source 387
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 387
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 388
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 390
    target 621
    relation "RELATES_TO"
  ]
  edge [
    source 391
    target 723
    relation "RELATES_TO"
  ]
  edge [
    source 391
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 393
    target 619
    relation "RELATES_TO"
  ]
  edge [
    source 394
    target 724
    relation "RELATES_TO"
  ]
  edge [
    source 394
    target 599
    relation "PERFORMS"
  ]
  edge [
    source 395
    target 725
    relation "RELATES_TO"
  ]
  edge [
    source 395
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 396
    target 602
    relation "RELATES_TO"
  ]
  edge [
    source 397
    target 622
    relation "RELATES_TO"
  ]
  edge [
    source 398
    target 711
    relation "RELATES_TO"
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
    source 399
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 399
    target 726
    relation "PERFORMS"
  ]
  edge [
    source 401
    target 727
    relation "RELATES_TO"
  ]
  edge [
    source 402
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 402
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 404
    target 599
    relation "PERFORMS"
  ]
  edge [
    source 405
    target 638
    relation "RELATES_TO"
  ]
  edge [
    source 406
    target 728
    relation "RELATES_TO"
  ]
  edge [
    source 407
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 408
    target 601
    relation "PERFORMS"
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
    source 409
    target 729
    relation "RELATES_TO"
  ]
  edge [
    source 409
    target 604
    relation "PERFORMS"
  ]
  edge [
    source 410
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 411
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 411
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 412
    target 730
    relation "RELATES_TO"
  ]
  edge [
    source 413
    target 731
    relation "RELATES_TO"
  ]
  edge [
    source 413
    target 606
    relation "PERFORMS"
  ]
  edge [
    source 414
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 415
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 416
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 417
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 418
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 418
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 419
    target 732
    relation "RELATES_TO"
  ]
  edge [
    source 420
    target 279
  ]
  edge [
    source 421
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 422
    target 275
  ]
  edge [
    source 422
    target 733
    relation "RELATES_TO"
  ]
  edge [
    source 422
    target 706
    relation "PERFORMS"
  ]
  edge [
    source 423
    target 734
    relation "RELATES_TO"
  ]
  edge [
    source 423
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 424
    target 642
    relation "RELATES_TO"
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
    source 427
    target 619
    relation "RELATES_TO"
  ]
  edge [
    source 428
    target 631
    relation "PERFORMS"
  ]
  edge [
    source 429
    target 611
    relation "RELATES_TO"
  ]
  edge [
    source 430
    target 625
    relation "RELATES_TO"
  ]
  edge [
    source 431
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 432
    target 631
    relation "RELATES_TO"
  ]
  edge [
    source 432
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 433
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 434
    target 631
    relation "PERFORMS"
  ]
  edge [
    source 435
    target 735
    relation "RELATES_TO"
  ]
  edge [
    source 436
    target 736
    relation "PERFORMS"
  ]
  edge [
    source 437
    target 644
    relation "RELATES_TO"
  ]
  edge [
    source 437
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 438
    target 737
    relation "RELATES_TO"
  ]
  edge [
    source 438
    target 598
    relation "PERFORMS"
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
    source 439
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 439
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 440
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 441
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 442
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 443
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 444
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 444
    target 650
    relation "PERFORMS"
  ]
  edge [
    source 445
    target 603
    relation "RELATES_TO"
  ]
  edge [
    source 446
    target 645
    relation "PERFORMS"
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
    source 447
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 448
    target 621
    relation "RELATES_TO"
  ]
  edge [
    source 449
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 450
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 451
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 452
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 452
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 453
    target 666
    relation "RELATES_TO"
  ]
  edge [
    source 454
    target 641
    relation "RELATES_TO"
  ]
  edge [
    source 455
    target 681
    relation "RELATES_TO"
  ]
  edge [
    source 456
    target 620
    relation "RELATES_TO"
  ]
  edge [
    source 457
    target 711
    relation "RELATES_TO"
  ]
  edge [
    source 458
    target 514
  ]
  edge [
    source 458
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 458
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 459
    target 625
    relation "RELATES_TO"
  ]
  edge [
    source 459
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 460
    target 707
    relation "RELATES_TO"
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
    source 461
    target 609
    relation "RELATES_TO"
  ]
  edge [
    source 462
    target 618
    relation "RELATES_TO"
  ]
  edge [
    source 462
    target 619
    relation "PERFORMS"
  ]
  edge [
    source 464
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 465
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 466
    target 639
    relation "RELATES_TO"
  ]
  edge [
    source 466
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 467
    target 603
    relation "RELATES_TO"
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
    source 469
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 469
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 470
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 470
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 471
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 472
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 472
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 473
    target 661
    relation "RELATES_TO"
  ]
  edge [
    source 473
    target 662
    relation "PERFORMS"
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
    source 474
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 475
    target 603
    relation "RELATES_TO"
  ]
  edge [
    source 476
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 476
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 477
    target 668
    relation "RELATES_TO"
  ]
  edge [
    source 478
    target 357
  ]
  edge [
    source 478
    target 662
    relation "RELATES_TO"
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
    source 479
    target 644
    relation "RELATES_TO"
  ]
  edge [
    source 479
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 480
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 480
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 481
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 482
    target 681
    relation "RELATES_TO"
  ]
  edge [
    source 482
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 483
    target 642
    relation "RELATES_TO"
  ]
  edge [
    source 484
    target 738
    relation "RELATES_TO"
  ]
  edge [
    source 484
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 485
    target 721
    relation "RELATES_TO"
  ]
  edge [
    source 486
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 487
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 488
    target 599
    relation "RELATES_TO"
  ]
  edge [
    source 489
    target 620
    relation "RELATES_TO"
  ]
  edge [
    source 490
    target 631
    relation "RELATES_TO"
  ]
  edge [
    source 490
    target 598
    relation "PERFORMS"
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
    source 491
    target 739
    relation "RELATES_TO"
  ]
  edge [
    source 492
    target 625
    relation "RELATES_TO"
  ]
  edge [
    source 492
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 493
    target 643
    relation "RELATES_TO"
  ]
  edge [
    source 495
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 495
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 496
    target 603
    relation "RELATES_TO"
  ]
  edge [
    source 497
    target 727
    relation "RELATES_TO"
  ]
  edge [
    source 497
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 498
    target 597
    relation "RELATES_TO"
  ]
  edge [
    source 498
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 500
    target 663
    relation "PERFORMS"
  ]
  edge [
    source 501
    target 732
    relation "RELATES_TO"
  ]
  edge [
    source 502
    target 621
    relation "RELATES_TO"
  ]
  edge [
    source 502
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 503
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 503
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 504
    target 711
    relation "RELATES_TO"
  ]
  edge [
    source 505
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 506
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 507
    target 740
    relation "RELATES_TO"
  ]
  edge [
    source 508
    target 670
    relation "RELATES_TO"
  ]
  edge [
    source 509
    target 678
    relation "PERFORMS"
  ]
  edge [
    source 510
    target 653
    relation "PERFORMS"
  ]
  edge [
    source 511
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 511
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 512
    target 652
    relation "PERFORMS"
  ]
  edge [
    source 513
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 514
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 514
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 515
    target 617
    relation "RELATES_TO"
  ]
  edge [
    source 516
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 516
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 517
    target 615
    relation "RELATES_TO"
  ]
  edge [
    source 517
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 518
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 520
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 521
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 522
    target 602
    relation "RELATES_TO"
  ]
  edge [
    source 523
    target 721
    relation "RELATES_TO"
  ]
  edge [
    source 523
    target 741
    relation "PERFORMS"
  ]
  edge [
    source 524
    target 680
    relation "RELATES_TO"
  ]
  edge [
    source 525
    target 727
    relation "PERFORMS"
  ]
  edge [
    source 526
    target 742
    relation "RELATES_TO"
  ]
  edge [
    source 526
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 527
    target 600
    relation "RELATES_TO"
  ]
  edge [
    source 528
    target 666
    relation "RELATES_TO"
  ]
  edge [
    source 529
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 530
    target 623
    relation "RELATES_TO"
  ]
  edge [
    source 530
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 531
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 531
    target 598
    relation "PERFORMS"
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
    source 532
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 533
    target 298
  ]
  edge [
    source 533
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 534
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 534
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 535
    target 677
    relation "PERFORMS"
  ]
  edge [
    source 536
    target 608
    relation "RELATES_TO"
  ]
  edge [
    source 537
    target 621
    relation "RELATES_TO"
  ]
  edge [
    source 537
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 538
    target 743
    relation "RELATES_TO"
  ]
  edge [
    source 538
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 539
    target 696
    relation "RELATES_TO"
  ]
  edge [
    source 540
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 541
    target 653
    relation "PERFORMS"
  ]
  edge [
    source 542
    target 655
    relation "RELATES_TO"
  ]
  edge [
    source 543
    target 644
    relation "RELATES_TO"
  ]
  edge [
    source 544
    target 744
    relation "RELATES_TO"
  ]
  edge [
    source 545
    target 721
    relation "RELATES_TO"
  ]
  edge [
    source 546
    target 635
    relation "RELATES_TO"
  ]
  edge [
    source 548
    target 745
    relation "RELATES_TO"
  ]
  edge [
    source 549
    target 668
    relation "RELATES_TO"
  ]
  edge [
    source 550
    target 637
    relation "PERFORMS"
  ]
  edge [
    source 551
    target 649
    relation "PERFORMS"
  ]
  edge [
    source 552
    target 715
    relation "PERFORMS"
  ]
  edge [
    source 553
    target 662
    relation "RELATES_TO"
  ]
  edge [
    source 554
    target 695
    relation "RELATES_TO"
  ]
  edge [
    source 555
    target 660
    relation "RELATES_TO"
  ]
  edge [
    source 556
    target 678
    relation "PERFORMS"
  ]
  edge [
    source 557
    target 704
    relation "RELATES_TO"
  ]
  edge [
    source 558
    target 710
    relation "RELATES_TO"
  ]
  edge [
    source 558
    target 613
    relation "PERFORMS"
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
    source 559
    target 746
    relation "RELATES_TO"
  ]
  edge [
    source 560
    target 644
    relation "RELATES_TO"
  ]
  edge [
    source 561
    target 695
    relation "RELATES_TO"
  ]
  edge [
    source 562
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 562
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 563
    target 631
    relation "PERFORMS"
  ]
  edge [
    source 564
    target 655
    relation "RELATES_TO"
  ]
  edge [
    source 565
    target 747
    relation "RELATES_TO"
  ]
  edge [
    source 566
    target 748
    relation "RELATES_TO"
  ]
  edge [
    source 567
    target 624
    relation "RELATES_TO"
  ]
  edge [
    source 567
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 568
    target 722
    relation "RELATES_TO"
  ]
  edge [
    source 569
    target 668
    relation "RELATES_TO"
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
    source 570
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 570
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 571
    target 673
    relation "PERFORMS"
  ]
  edge [
    source 572
    target 613
    relation "PERFORMS"
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
    source 573
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 573
    target 606
    relation "PERFORMS"
  ]
  edge [
    source 574
    target 746
    relation "RELATES_TO"
  ]
  edge [
    source 575
    target 699
    relation "RELATES_TO"
  ]
  edge [
    source 576
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 576
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 577
    target 638
    relation "RELATES_TO"
  ]
  edge [
    source 577
    target 613
    relation "PERFORMS"
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
    source 578
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 578
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 579
    target 627
    relation "RELATES_TO"
  ]
  edge [
    source 579
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 580
    target 655
    relation "RELATES_TO"
  ]
  edge [
    source 581
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 582
    target 645
    relation "PERFORMS"
  ]
  edge [
    source 584
    target 588
  ]
  edge [
    source 584
    target 749
    relation "RELATES_TO"
  ]
  edge [
    source 584
    target 750
    relation "PERFORMS"
  ]
  edge [
    source 585
    target 623
    relation "RELATES_TO"
  ]
  edge [
    source 585
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 586
    target 751
    relation "PERFORMS"
  ]
  edge [
    source 587
    target 613
    relation "PERFORMS"
  ]
  edge [
    source 588
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 589
    target 633
    relation "RELATES_TO"
  ]
  edge [
    source 589
    target 599
    relation "PERFORMS"
  ]
  edge [
    source 590
    target 711
    relation "RELATES_TO"
  ]
  edge [
    source 590
    target 598
    relation "PERFORMS"
  ]
  edge [
    source 592
    target 644
    relation "RELATES_TO"
  ]
  edge [
    source 593
    target 294
  ]
  edge [
    source 593
    target 629
    relation "RELATES_TO"
  ]
  edge [
    source 593
    target 605
    relation "PERFORMS"
  ]
  edge [
    source 594
    target 603
    relation "RELATES_TO"
  ]
  edge [
    source 595
    target 526
  ]
  edge [
    source 595
    target 408
  ]
  edge [
    source 595
    target 722
    relation "RELATES_TO"
  ]
  edge [
    source 595
    target 601
    relation "PERFORMS"
  ]
  edge [
    source 596
    target 675
    relation "PERFORMS"
  ]
  edge [
    source 597
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 597
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 599
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 599
    target 601
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 599
    target 673
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 599
    target 726
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 600
    target 601
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 600
    target 605
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 600
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 600
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 602
    target 659
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 602
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 608
    target 609
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 610
    target 611
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 612
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 614
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 615
    target 645
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 615
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 617
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 617
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 618
    target 619
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 621
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 621
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 623
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 623
    target 605
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 624
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 625
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 625
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 627
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 627
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 629
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 629
    target 601
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 629
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 629
    target 606
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 629
    target 605
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 631
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 633
    target 605
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 633
    target 599
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 635
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 635
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 638
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 639
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 639
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 644
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 647
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 661
    target 662
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 665
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 666
    target 645
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 671
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 672
    target 673
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 680
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 680
    target 650
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 681
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 681
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 684
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 685
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 687
    target 606
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 688
    target 609
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 689
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 693
    target 694
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 702
    target 703
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 704
    target 599
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 710
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 711
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 711
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 712
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 714
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 721
    target 741
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 722
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 722
    target 601
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 723
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 724
    target 599
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 725
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 727
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 729
    target 604
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 731
    target 606
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 733
    target 706
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 734
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 737
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 738
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 742
    target 613
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 743
    target 598
    relation "INVOLVES_ACTION"
  ]
  edge [
    source 749
    target 750
    relation "INVOLVES_ACTION"
  ]
]
