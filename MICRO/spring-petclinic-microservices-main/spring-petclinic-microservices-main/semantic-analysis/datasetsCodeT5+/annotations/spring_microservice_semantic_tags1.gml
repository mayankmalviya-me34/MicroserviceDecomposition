graph [
  directed 1
  node [
    id 0
    label "spring-petclinic-admin-server\src\main\java\org\springframework\samples\petclinic\admin\SpringBootAdminApplication.java"
    type "file"
  ]
  node [
    id 1
    label "spring-petclinic-admin-server\src\main\java\org\springframework\samples\petclinic\admin\SpringBootAdminApplication.java::main"
    type "function"
    intent ""
    domain "copyright"
    business_role "APPLICATION"
  ]
  node [
    id 2
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java"
    type "file"
  ]
  node [
    id 3
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java::main"
    type "function"
    intent "READ"
    domain "new"
    business_role "APPLICATION"
  ]
  node [
    id 4
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java::loadBalancedRestTemplate"
    type "function"
    intent "READ"
    domain "new"
    business_role "APPLICATION"
  ]
  node [
    id 5
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java::loadBalancedWebClientBuilder"
    type "function"
    intent "READ"
    domain "new"
    business_role "APPLICATION"
  ]
  node [
    id 6
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java::routerFunction"
    type "function"
    intent "READ"
    domain "new"
    business_role "APPLICATION"
  ]
  node [
    id 7
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java::defaultCustomizer"
    type "function"
    intent "READ"
    domain "new"
    business_role "APPLICATION"
  ]
  node [
    id 8
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\CustomersServiceClient.java"
    type "file"
  ]
  node [
    id 9
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\CustomersServiceClient.java::getOwner"
    type "function"
    intent "READ"
    domain "ownerid"
    business_role "SERVICE"
  ]
  node [
    id 10
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\VisitsServiceClient.java"
    type "file"
  ]
  node [
    id 11
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\VisitsServiceClient.java::getVisitsForPets"
    type "function"
    intent "READ"
    domain ""
    business_role "SERVICE"
  ]
  node [
    id 12
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\VisitsServiceClient.java::joinIds"
    type "function"
    intent ""
    domain ""
    business_role "SERVICE"
  ]
  node [
    id 13
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\VisitsServiceClient.java::setHostname"
    type "function"
    intent ""
    domain ""
    business_role "SERVICE"
  ]
  node [
    id 14
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayController.java"
    type "file"
  ]
  node [
    id 15
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayController.java::getOwnerDetails"
    type "function"
    intent "READ"
    domain "author"
    business_role "CONTROLLER"
  ]
  node [
    id 16
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayController.java::addVisitsToOwner"
    type "function"
    intent "CREATE"
    domain "author"
    business_role "CONTROLLER"
  ]
  node [
    id 17
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayController.java::emptyVisitsForPets"
    type "function"
    intent ""
    domain "author"
    business_role "CONTROLLER"
  ]
  node [
    id 18
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayControllerTest.java"
    type "file"
  ]
  node [
    id 19
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayControllerTest.java::getOwnerDetails_withAvailableVisitsService"
    type "function"
    intent "READ"
    domain "test"
    business_role "CONTROLLER"
  ]
  node [
    id 20
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayControllerTest.java::getOwnerDetails_withServiceError"
    type "function"
    intent "READ"
    domain "test"
    business_role "CONTROLLER"
  ]
  node [
    id 21
    label "spring-petclinic-config-server\src\main\java\org\springframework\samples\petclinic\config\ConfigServerApplication.java"
    type "file"
  ]
  node [
    id 22
    label "spring-petclinic-config-server\src\main\java\org\springframework\samples\petclinic\config\ConfigServerApplication.java::main"
    type "function"
    intent ""
    domain "author"
    business_role "APPLICATION"
  ]
  node [
    id 23
    label "spring-petclinic-config-server\src\test\java\org\springframework\samples\petclinic\config\PetclinicConfigServerApplicationTests.java"
    type "file"
  ]
  node [
    id 24
    label "spring-petclinic-config-server\src\test\java\org\springframework\samples\petclinic\config\PetclinicConfigServerApplicationTests.java::contextLoads"
    type "function"
    intent ""
    domain "copyright"
    business_role "APPLICATION"
  ]
  node [
    id 25
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\CustomersServiceApplication.java"
    type "file"
  ]
  node [
    id 26
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\CustomersServiceApplication.java::main"
    type "function"
    intent ""
    domain "author"
    business_role "SERVICE"
  ]
  node [
    id 27
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java"
    type "file"
  ]
  node [
    id 28
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getPetsInternal"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 29
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getPets"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 30
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::addPet"
    type "function"
    intent "CREATE"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 31
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::toString"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 32
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getId"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 33
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getFirstName"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 34
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getLastName"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 35
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getAddress"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 36
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getCity"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 37
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getTelephone"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 38
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::setFirstName"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 39
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::setLastName"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 40
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::setAddress"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 41
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::setCity"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 42
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::setTelephone"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 43
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java"
    type "file"
  ]
  node [
    id 44
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::toString"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 45
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::getId"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 46
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::getName"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 47
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::getBirthDate"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 48
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::getType"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 49
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::getOwner"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 50
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::setId"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 51
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::setName"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 52
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::setBirthDate"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 53
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::setType"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 54
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::setOwner"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 55
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::equals"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 56
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::hashCode"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 57
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\PetType.java"
    type "file"
  ]
  node [
    id 58
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\PetType.java::getId"
    type "function"
    intent "READ"
    domain "author"
    business_role "UNKNOWN"
  ]
  node [
    id 59
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\PetType.java::getName"
    type "function"
    intent "READ"
    domain "author"
    business_role "UNKNOWN"
  ]
  node [
    id 60
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\PetType.java::setId"
    type "function"
    intent ""
    domain "author"
    business_role "UNKNOWN"
  ]
  node [
    id 61
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\PetType.java::setName"
    type "function"
    intent ""
    domain "author"
    business_role "UNKNOWN"
  ]
  node [
    id 62
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\OwnerResource.java"
    type "file"
  ]
  node [
    id 63
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\OwnerResource.java::createOwner"
    type "function"
    intent "CREATE"
    domain "update"
    business_role "UNKNOWN"
  ]
  node [
    id 64
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\OwnerResource.java::findOwner"
    type "function"
    intent "READ"
    domain "update"
    business_role "UNKNOWN"
  ]
  node [
    id 65
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\OwnerResource.java::findAll"
    type "function"
    intent "READ"
    domain "update"
    business_role "UNKNOWN"
  ]
  node [
    id 66
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\OwnerResource.java::updateOwner"
    type "function"
    intent "UPDATE"
    domain "update"
    business_role "UNKNOWN"
  ]
  node [
    id 67
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java"
    type "file"
  ]
  node [
    id 68
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::getPetTypes"
    type "function"
    intent "READ"
    domain "petid"
    business_role "UNKNOWN"
  ]
  node [
    id 69
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::processCreationForm"
    type "function"
    intent "UPDATE"
    domain "petid"
    business_role "UNKNOWN"
  ]
  node [
    id 70
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::processUpdateForm"
    type "function"
    intent "UPDATE"
    domain "petid"
    business_role "UNKNOWN"
  ]
  node [
    id 71
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::save"
    type "function"
    intent "CREATE"
    domain "petid"
    business_role "UNKNOWN"
  ]
  node [
    id 72
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::findPet"
    type "function"
    intent "READ"
    domain "petid"
    business_role "UNKNOWN"
  ]
  node [
    id 73
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::findPetById"
    type "function"
    intent "READ"
    domain "petid"
    business_role "UNKNOWN"
  ]
  node [
    id 74
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\mapper\OwnerEntityMapper.java"
    type "file"
  ]
  node [
    id 75
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\mapper\OwnerEntityMapper.java::map"
    type "function"
    intent ""
    domain "this"
    business_role "ENTITY"
  ]
  node [
    id 76
    label "spring-petclinic-customers-service\src\test\java\org\springframework\samples\petclinic\customers\web\PetResourceTest.java"
    type "file"
  ]
  node [
    id 77
    label "spring-petclinic-customers-service\src\test\java\org\springframework\samples\petclinic\customers\web\PetResourceTest.java::shouldGetAPetInJSonFormat"
    type "function"
    intent "READ"
    domain "author"
    business_role "UNKNOWN"
  ]
  node [
    id 78
    label "spring-petclinic-customers-service\src\test\java\org\springframework\samples\petclinic\customers\web\PetResourceTest.java::setupPet"
    type "function"
    intent ""
    domain "author"
    business_role "UNKNOWN"
  ]
  node [
    id 79
    label "spring-petclinic-discovery-server\src\main\java\org\springframework\samples\petclinic\discovery\DiscoveryServerApplication.java"
    type "file"
  ]
  node [
    id 80
    label "spring-petclinic-discovery-server\src\main\java\org\springframework\samples\petclinic\discovery\DiscoveryServerApplication.java::main"
    type "function"
    intent ""
    domain "author"
    business_role "APPLICATION"
  ]
  node [
    id 81
    label "spring-petclinic-discovery-server\src\test\java\org\springframework\samples\petclinic\discovery\DiscoveryServerApplicationTests.java"
    type "file"
  ]
  node [
    id 82
    label "spring-petclinic-discovery-server\src\test\java\org\springframework\samples\petclinic\discovery\DiscoveryServerApplicationTests.java::contextLoads"
    type "function"
    intent ""
    domain "copyright"
    business_role "APPLICATION"
  ]
  node [
    id 83
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIBeanConfiguration.java"
    type "file"
  ]
  node [
    id 84
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIBeanConfiguration.java::chatMemory"
    type "function"
    intent ""
    domain "a"
    business_role "UNKNOWN"
  ]
  node [
    id 85
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIBeanConfiguration.java::vectorStore"
    type "function"
    intent ""
    domain "a"
    business_role "UNKNOWN"
  ]
  node [
    id 86
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIBeanConfiguration.java::loadBalancedWebClientBuilder"
    type "function"
    intent ""
    domain "a"
    business_role "UNKNOWN"
  ]
  node [
    id 87
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIDataProvider.java"
    type "file"
  ]
  node [
    id 88
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIDataProvider.java::getAllOwners"
    type "function"
    intent "READ"
    domain "provide"
    business_role "UNKNOWN"
  ]
  node [
    id 89
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIDataProvider.java::getVets"
    type "function"
    intent "READ"
    domain "provide"
    business_role "UNKNOWN"
  ]
  node [
    id 90
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIDataProvider.java::addPetToOwner"
    type "function"
    intent "CREATE"
    domain "provide"
    business_role "UNKNOWN"
  ]
  node [
    id 91
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIDataProvider.java::addOwnerToPetclinic"
    type "function"
    intent "CREATE"
    domain "provide"
    business_role "UNKNOWN"
  ]
  node [
    id 92
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\GenAIServiceApplication.java"
    type "file"
  ]
  node [
    id 93
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\GenAIServiceApplication.java::main"
    type "function"
    intent ""
    domain "author"
    business_role "SERVICE"
  ]
  node [
    id 94
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\VectorStoreController.java"
    type "file"
  ]
  node [
    id 95
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\VectorStoreController.java::loadVetDataToVectorStoreOnStartup"
    type "function"
    intent "CREATE"
    domain "create"
    business_role "CONTROLLER"
  ]
  node [
    id 96
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\VectorStoreController.java::convertListToJsonResource"
    type "function"
    intent "CREATE"
    domain "create"
    business_role "CONTROLLER"
  ]
  node [
    id 97
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\VetsServiceApplication.java"
    type "file"
  ]
  node [
    id 98
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\VetsServiceApplication.java::main"
    type "function"
    intent ""
    domain "author"
    business_role "SERVICE"
  ]
  node [
    id 99
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Specialty.java"
    type "file"
  ]
  node [
    id 100
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Specialty.java::getId"
    type "function"
    intent "READ"
    domain "models"
    business_role "UNKNOWN"
  ]
  node [
    id 101
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Specialty.java::getName"
    type "function"
    intent "READ"
    domain "models"
    business_role "UNKNOWN"
  ]
  node [
    id 102
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Specialty.java::setName"
    type "function"
    intent ""
    domain "models"
    business_role "UNKNOWN"
  ]
  node [
    id 103
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java"
    type "file"
  ]
  node [
    id 104
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getSpecialtiesInternal"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 105
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getSpecialties"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 106
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getNrOfSpecialties"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 107
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::addSpecialty"
    type "function"
    intent "CREATE"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 108
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getId"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 109
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getFirstName"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 110
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getLastName"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 111
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::setId"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 112
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::setFirstName"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 113
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::setLastName"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 114
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\web\VetResource.java"
    type "file"
  ]
  node [
    id 115
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\web\VetResource.java::showResourcesVetList"
    type "function"
    intent ""
    domain "author"
    business_role "UNKNOWN"
  ]
  node [
    id 116
    label "spring-petclinic-vets-service\src\test\java\org\springframework\samples\petclinic\vets\web\VetResourceTest.java"
    type "file"
  ]
  node [
    id 117
    label "spring-petclinic-vets-service\src\test\java\org\springframework\samples\petclinic\vets\web\VetResourceTest.java::shouldGetAListOfVets"
    type "function"
    intent "READ"
    domain "author"
    business_role "UNKNOWN"
  ]
  node [
    id 118
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\VisitsServiceApplication.java"
    type "file"
  ]
  node [
    id 119
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\VisitsServiceApplication.java::main"
    type "function"
    intent ""
    domain "author"
    business_role "SERVICE"
  ]
  node [
    id 120
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java"
    type "file"
  ]
  node [
    id 121
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::getId"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 122
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::getDate"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 123
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::getDescription"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 124
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::getPetId"
    type "function"
    intent "READ"
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 125
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::setId"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 126
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::setDate"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 127
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::setDescription"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 128
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::setPetId"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 129
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::aVisit"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 130
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::id"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 131
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::date"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 132
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::description"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 133
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::petId"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 134
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::build"
    type "function"
    intent ""
    domain "simple"
    business_role "UNKNOWN"
  ]
  node [
    id 135
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\web\VisitResource.java"
    type "file"
  ]
  node [
    id 136
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\web\VisitResource.java::create"
    type "function"
    intent "CREATE"
    domain "petid"
    business_role "UNKNOWN"
  ]
  node [
    id 137
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\web\VisitResource.java::read"
    type "function"
    intent "CREATE"
    domain "petid"
    business_role "UNKNOWN"
  ]
  node [
    id 138
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\web\VisitResource.java::Visits"
    type "function"
    intent "CREATE"
    domain "petid"
    business_role "UNKNOWN"
  ]
  node [
    id 139
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java"
    type "file"
  ]
  node [
    id 140
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java::main"
    type "function"
    intent ""
    domain ""
    business_role "UNKNOWN"
  ]
  node [
    id 141
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java::parseFile"
    type "function"
    intent ""
    domain ""
    business_role "UNKNOWN"
  ]
  node [
    id 142
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java::exportStaticGraphGML"
    type "function"
    intent ""
    domain ""
    business_role "UNKNOWN"
  ]
  node [
    id 143
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java::exportSemanticJSON"
    type "function"
    intent ""
    domain ""
    business_role "UNKNOWN"
  ]
  node [
    id 144
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java::exportSemanticGraphML"
    type "function"
    intent ""
    domain ""
    business_role "UNKNOWN"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 2
    target 3
  ]
  edge [
    source 2
    target 4
  ]
  edge [
    source 2
    target 5
  ]
  edge [
    source 2
    target 6
  ]
  edge [
    source 2
    target 7
  ]
  edge [
    source 8
    target 9
  ]
  edge [
    source 10
    target 11
  ]
  edge [
    source 10
    target 12
  ]
  edge [
    source 10
    target 13
  ]
  edge [
    source 14
    target 15
  ]
  edge [
    source 14
    target 16
  ]
  edge [
    source 14
    target 17
  ]
  edge [
    source 18
    target 19
  ]
  edge [
    source 18
    target 20
  ]
  edge [
    source 21
    target 22
  ]
  edge [
    source 23
    target 24
  ]
  edge [
    source 25
    target 26
  ]
  edge [
    source 27
    target 28
  ]
  edge [
    source 27
    target 29
  ]
  edge [
    source 27
    target 30
  ]
  edge [
    source 27
    target 31
  ]
  edge [
    source 27
    target 32
  ]
  edge [
    source 27
    target 33
  ]
  edge [
    source 27
    target 34
  ]
  edge [
    source 27
    target 35
  ]
  edge [
    source 27
    target 36
  ]
  edge [
    source 27
    target 37
  ]
  edge [
    source 27
    target 38
  ]
  edge [
    source 27
    target 39
  ]
  edge [
    source 27
    target 40
  ]
  edge [
    source 27
    target 41
  ]
  edge [
    source 27
    target 42
  ]
  edge [
    source 43
    target 44
  ]
  edge [
    source 43
    target 45
  ]
  edge [
    source 43
    target 46
  ]
  edge [
    source 43
    target 47
  ]
  edge [
    source 43
    target 48
  ]
  edge [
    source 43
    target 49
  ]
  edge [
    source 43
    target 50
  ]
  edge [
    source 43
    target 51
  ]
  edge [
    source 43
    target 52
  ]
  edge [
    source 43
    target 53
  ]
  edge [
    source 43
    target 54
  ]
  edge [
    source 43
    target 55
  ]
  edge [
    source 43
    target 56
  ]
  edge [
    source 57
    target 58
  ]
  edge [
    source 57
    target 59
  ]
  edge [
    source 57
    target 60
  ]
  edge [
    source 57
    target 61
  ]
  edge [
    source 62
    target 63
  ]
  edge [
    source 62
    target 64
  ]
  edge [
    source 62
    target 65
  ]
  edge [
    source 62
    target 66
  ]
  edge [
    source 67
    target 68
  ]
  edge [
    source 67
    target 69
  ]
  edge [
    source 67
    target 70
  ]
  edge [
    source 67
    target 71
  ]
  edge [
    source 67
    target 72
  ]
  edge [
    source 67
    target 73
  ]
  edge [
    source 74
    target 75
  ]
  edge [
    source 76
    target 77
  ]
  edge [
    source 76
    target 78
  ]
  edge [
    source 79
    target 80
  ]
  edge [
    source 81
    target 82
  ]
  edge [
    source 83
    target 84
  ]
  edge [
    source 83
    target 85
  ]
  edge [
    source 83
    target 86
  ]
  edge [
    source 87
    target 88
  ]
  edge [
    source 87
    target 89
  ]
  edge [
    source 87
    target 90
  ]
  edge [
    source 87
    target 91
  ]
  edge [
    source 92
    target 93
  ]
  edge [
    source 94
    target 95
  ]
  edge [
    source 94
    target 96
  ]
  edge [
    source 97
    target 98
  ]
  edge [
    source 99
    target 100
  ]
  edge [
    source 99
    target 101
  ]
  edge [
    source 99
    target 102
  ]
  edge [
    source 103
    target 104
  ]
  edge [
    source 103
    target 105
  ]
  edge [
    source 103
    target 106
  ]
  edge [
    source 103
    target 107
  ]
  edge [
    source 103
    target 108
  ]
  edge [
    source 103
    target 109
  ]
  edge [
    source 103
    target 110
  ]
  edge [
    source 103
    target 111
  ]
  edge [
    source 103
    target 112
  ]
  edge [
    source 103
    target 113
  ]
  edge [
    source 114
    target 115
  ]
  edge [
    source 116
    target 117
  ]
  edge [
    source 118
    target 119
  ]
  edge [
    source 120
    target 121
  ]
  edge [
    source 120
    target 122
  ]
  edge [
    source 120
    target 123
  ]
  edge [
    source 120
    target 124
  ]
  edge [
    source 120
    target 125
  ]
  edge [
    source 120
    target 126
  ]
  edge [
    source 120
    target 127
  ]
  edge [
    source 120
    target 128
  ]
  edge [
    source 120
    target 129
  ]
  edge [
    source 120
    target 130
  ]
  edge [
    source 120
    target 131
  ]
  edge [
    source 120
    target 132
  ]
  edge [
    source 120
    target 133
  ]
  edge [
    source 120
    target 134
  ]
  edge [
    source 135
    target 136
  ]
  edge [
    source 135
    target 137
  ]
  edge [
    source 135
    target 138
  ]
  edge [
    source 139
    target 140
  ]
  edge [
    source 139
    target 141
  ]
  edge [
    source 139
    target 142
  ]
  edge [
    source 139
    target 143
  ]
  edge [
    source 139
    target 144
  ]
]
