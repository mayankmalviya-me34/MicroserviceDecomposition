graph [
  directed 1
  node [
    id 0
    label "../src\main\java\org\springframework\samples\petclinic\PetClinicApplication.java"
    type "file"
  ]
  node [
    id 1
    label "../src\main\java\org\springframework\samples\petclinic\PetClinicApplication.java::main"
    type "function"
    intent ""
    domain "PetClinic"
    business_role "APPLICATION"
  ]
  node [
    id 2
    label "../src\main\java\org\springframework\samples\petclinic\PetClinicRuntimeHints.java"
    type "file"
  ]
  node [
    id 3
    label "../src\main\java\org\springframework\samples\petclinic\PetClinicRuntimeHints.java::registerHints"
    type "function"
    intent ""
    domain ""
    business_role "UNKNOWN"
  ]
  node [
    id 4
    label "../src\main\java\org\springframework\samples\petclinic\model\BaseEntity.java"
    type "file"
  ]
  node [
    id 5
    label "../src\main\java\org\springframework\samples\petclinic\model\BaseEntity.java::getId"
    type "function"
    intent ""
    domain "JavaBean"
    business_role "ENTITY"
  ]
  node [
    id 6
    label "../src\main\java\org\springframework\samples\petclinic\model\NamedEntity.java"
    type "file"
  ]
  node [
    id 7
    label "../src\main\java\org\springframework\samples\petclinic\model\NamedEntity.java::getName"
    type "function"
    intent "CREATE"
    domain "JavaBean"
    business_role "ENTITY"
  ]
  node [
    id 8
    label "../src\main\java\org\springframework\samples\petclinic\model\package-info.java"
    type "file"
  ]
  node [
    id 9
    label "../src\main\java\org\springframework\samples\petclinic\model\package-info.java::"
    type "function"
    intent ""
    domain "class"
    business_role "ENTITY"
  ]
  node [
    id 10
    label "../src\main\java\org\springframework\samples\petclinic\model\Person.java"
    type "file"
  ]
  node [
    id 11
    label "../src\main\java\org\springframework\samples\petclinic\model\Person.java::getFirstName"
    type "function"
    intent ""
    domain "JavaBean"
    business_role "ENTITY"
  ]
  node [
    id 12
    label "../src\main\java\org\springframework\samples\petclinic\owner\Owner.java"
    type "file"
  ]
  node [
    id 13
    label "../src\main\java\org\springframework\samples\petclinic\owner\Owner.java::getAddress"
    type "function"
    intent "CREATE"
    domain "@link"
    business_role "UNKNOWN"
  ]
  node [
    id 14
    label "../src\main\java\org\springframework\samples\petclinic\owner\OwnerController.java"
    type "file"
  ]
  node [
    id 15
    label "../src\main\java\org\springframework\samples\petclinic\owner\OwnerController.java::OwnerController"
    type "function"
    intent ""
    domain "Custom"
    business_role "CONTROLLER"
  ]
  node [
    id 16
    label "../src\main\java\org\springframework\samples\petclinic\owner\OwnerRepository.java"
    type "file"
  ]
  node [
    id 17
    label "../src\main\java\org\springframework\samples\petclinic\owner\OwnerRepository.java::findByLastNameStartingWith"
    type "function"
    intent "READ"
    domain "@link"
    business_role "REPOSITORY"
  ]
  node [
    id 18
    label "../src\main\java\org\springframework\samples\petclinic\owner\Pet.java"
    type "file"
  ]
  node [
    id 19
    label "../src\main\java\org\springframework\samples\petclinic\owner\Pet.java::setBirthDate"
    type "function"
    intent ""
    domain "business"
    business_role "UNKNOWN"
  ]
  node [
    id 20
    label "../src\main\java\org\springframework\samples\petclinic\owner\PetController.java"
    type "file"
  ]
  node [
    id 21
    label "../src\main\java\org\springframework\samples\petclinic\owner\PetController.java::PetController"
    type "function"
    intent "UPDATE"
    domain "detail"
    business_role "CONTROLLER"
  ]
  node [
    id 22
    label "../src\main\java\org\springframework\samples\petclinic\owner\PetType.java"
    type "file"
  ]
  node [
    id 23
    label "../src\main\java\org\springframework\samples\petclinic\owner\PetType.java::"
    type "function"
    intent ""
    domain "@author"
    business_role "UNKNOWN"
  ]
  node [
    id 24
    label "../src\main\java\org\springframework\samples\petclinic\owner\PetTypeFormatter.java"
    type "file"
  ]
  node [
    id 25
    label "../src\main\java\org\springframework\samples\petclinic\owner\PetTypeFormatter.java::PetTypeFormatter"
    type "function"
    intent ""
    domain "instruct"
    business_role "COMPONENT"
  ]
  node [
    id 26
    label "../src\main\java\org\springframework\samples\petclinic\owner\PetTypeRepository.java"
    type "file"
  ]
  node [
    id 27
    label "../src\main\java\org\springframework\samples\petclinic\owner\PetTypeRepository.java::findPetTypes"
    type "function"
    intent "READ"
    domain "@link"
    business_role "REPOSITORY"
  ]
  node [
    id 28
    label "../src\main\java\org\springframework\samples\petclinic\owner\PetValidator.java"
    type "file"
  ]
  node [
    id 29
    label "../src\main\java\org\springframework\samples\petclinic\owner\PetValidator.java::validate"
    type "function"
    intent ""
    domain "Validator"
    business_role "UNKNOWN"
  ]
  node [
    id 30
    label "../src\main\java\org\springframework\samples\petclinic\owner\Visit.java"
    type "file"
  ]
  node [
    id 31
    label "../src\main\java\org\springframework\samples\petclinic\owner\Visit.java::Visit"
    type "function"
    intent "CREATE"
    domain "instance"
    business_role "UNKNOWN"
  ]
  node [
    id 32
    label "../src\main\java\org\springframework\samples\petclinic\owner\VisitController.java"
    type "file"
  ]
  node [
    id 33
    label "../src\main\java\org\springframework\samples\petclinic\owner\VisitController.java::VisitController"
    type "function"
    intent ""
    domain "method"
    business_role "CONTROLLER"
  ]
  node [
    id 34
    label "../src\main\java\org\springframework\samples\petclinic\system\CacheConfiguration.java"
    type "file"
  ]
  node [
    id 35
    label "../src\main\java\org\springframework\samples\petclinic\system\CacheConfiguration.java::petclinicCacheConfigurationCustomizer"
    type "function"
    intent "UPDATE"
    domain "configuration"
    business_role "UNKNOWN"
  ]
  node [
    id 36
    label "../src\main\java\org\springframework\samples\petclinic\system\CrashController.java"
    type "file"
  ]
  node [
    id 37
    label "../src\main\java\org\springframework\samples\petclinic\system\CrashController.java::added"
    type "function"
    intent "CREATE"
    domain "Controller"
    business_role "CONTROLLER"
  ]
  node [
    id 38
    label "../src\main\java\org\springframework\samples\petclinic\system\WebConfiguration.java"
    type "file"
  ]
  node [
    id 39
    label "../src\main\java\org\springframework\samples\petclinic\system\WebConfiguration.java::internationalization"
    type "function"
    intent "CREATE"
    domain "register"
    business_role "UNKNOWN"
  ]
  node [
    id 40
    label "../src\main\java\org\springframework\samples\petclinic\vet\Specialty.java"
    type "file"
  ]
  node [
    id 41
    label "../src\main\java\org\springframework\samples\petclinic\vet\Specialty.java::"
    type "function"
    intent ""
    domain "model"
    business_role "UNKNOWN"
  ]
  node [
    id 42
    label "../src\main\java\org\springframework\samples\petclinic\vet\Vet.java"
    type "file"
  ]
  node [
    id 43
    label "../src\main\java\org\springframework\samples\petclinic\vet\Vet.java::getSpecialtiesInternal"
    type "function"
    intent ""
    domain "JavaBean"
    business_role "UNKNOWN"
  ]
  node [
    id 44
    label "../src\main\java\org\springframework\samples\petclinic\vet\VetController.java"
    type "file"
  ]
  node [
    id 45
    label "../src\main\java\org\springframework\samples\petclinic\vet\VetController.java::VetController"
    type "function"
    intent ""
    domain "@author"
    business_role "CONTROLLER"
  ]
  node [
    id 46
    label "../src\main\java\org\springframework\samples\petclinic\vet\VetRepository.java"
    type "file"
  ]
  node [
    id 47
    label "../src\main\java\org\springframework\samples\petclinic\vet\VetRepository.java::findAll"
    type "function"
    intent "READ"
    domain "code"
    business_role "REPOSITORY"
  ]
  node [
    id 48
    label "../src\main\java\org\springframework\samples\petclinic\vet\Vets.java"
    type "file"
  ]
  node [
    id 49
    label "../src\main\java\org\springframework\samples\petclinic\vet\Vets.java::getVetList"
    type "function"
    intent ""
    domain "domain"
    business_role "UNKNOWN"
  ]
  node [
    id 50
    label "../src\main\java\tools\PetClinicGraphExtractor.java"
    type "file"
  ]
  node [
    id 51
    label "../src\main\java\tools\PetClinicGraphExtractor.java::main"
    type "function"
    intent ""
    domain "graph"
    business_role "UNKNOWN"
  ]
  node [
    id 52
    label "../src\test\java\org\springframework\samples\petclinic\MySqlIntegrationTests.java"
    type "file"
  ]
  node [
    id 53
    label "../src\test\java\org\springframework\samples\petclinic\MySqlIntegrationTests.java::testFindAll"
    type "function"
    intent ""
    domain "localhost"
    business_role "SERVICE"
  ]
  node [
    id 54
    label "../src\test\java\org\springframework\samples\petclinic\MysqlTestApplication.java"
    type "file"
  ]
  node [
    id 55
    label "../src\test\java\org\springframework\samples\petclinic\MysqlTestApplication.java::main"
    type "function"
    intent ""
    domain "PetClinic"
    business_role "SERVICE"
  ]
  node [
    id 56
    label "../src\test\java\org\springframework\samples\petclinic\PetClinicIntegrationTests.java"
    type "file"
  ]
  node [
    id 57
    label "../src\test\java\org\springframework\samples\petclinic\PetClinicIntegrationTests.java::testFindAll"
    type "function"
    intent ""
    domain "localhost"
    business_role "UNKNOWN"
  ]
  node [
    id 58
    label "../src\test\java\org\springframework\samples\petclinic\PostgresIntegrationTests.java"
    type "file"
  ]
  node [
    id 59
    label "../src\test\java\org\springframework\samples\petclinic\PostgresIntegrationTests.java::available"
    type "function"
    intent ""
    domain "localhost"
    business_role "UNKNOWN"
  ]
  node [
    id 60
    label "../src\test\java\org\springframework\samples\petclinic\model\ValidatorTests.java"
    type "file"
  ]
  node [
    id 61
    label "../src\test\java\org\springframework\samples\petclinic\model\ValidatorTests.java::working"
    type "function"
    intent ""
    domain "@author"
    business_role "ENTITY"
  ]
  node [
    id 62
    label "../src\test\java\org\springframework\samples\petclinic\owner\OwnerControllerTests.java"
    type "file"
  ]
  node [
    id 63
    label "../src\test\java\org\springframework\samples\petclinic\owner\OwnerControllerTests.java::george"
    type "function"
    intent ""
    domain "test"
    business_role "CONTROLLER"
  ]
  node [
    id 64
    label "../src\test\java\org\springframework\samples\petclinic\owner\PetControllerTests.java"
    type "file"
  ]
  node [
    id 65
    label "../src\test\java\org\springframework\samples\petclinic\owner\PetControllerTests.java::setup"
    type "function"
    intent ""
    domain "test"
    business_role "COMPONENT"
  ]
  node [
    id 66
    label "../src\test\java\org\springframework\samples\petclinic\owner\PetTypeFormatterTests.java"
    type "file"
  ]
  node [
    id 67
    label "../src\test\java\org\springframework\samples\petclinic\owner\PetTypeFormatterTests.java::setup"
    type "function"
    intent ""
    domain "helper"
    business_role "UNKNOWN"
  ]
  node [
    id 68
    label "../src\test\java\org\springframework\samples\petclinic\owner\PetValidatorTests.java"
    type "file"
  ]
  node [
    id 69
    label "../src\test\java\org\springframework\samples\petclinic\owner\PetValidatorTests.java::setUp"
    type "function"
    intent ""
    domain "test"
    business_role "UNKNOWN"
  ]
  node [
    id 70
    label "../src\test\java\org\springframework\samples\petclinic\owner\VisitControllerTests.java"
    type "file"
  ]
  node [
    id 71
    label "../src\test\java\org\springframework\samples\petclinic\owner\VisitControllerTests.java::init"
    type "function"
    intent ""
    domain "test"
    business_role "CONTROLLER"
  ]
  node [
    id 72
    label "../src\test\java\org\springframework\samples\petclinic\service\ClinicServiceTests.java"
    type "file"
  ]
  node [
    id 73
    label "../src\test\java\org\springframework\samples\petclinic\service\ClinicServiceTests.java::shouldFindOwnersByLastName"
    type "function"
    intent "UPDATE"
    domain "integration"
    business_role "SERVICE"
  ]
  node [
    id 74
    label "../src\test\java\org\springframework\samples\petclinic\service\EntityUtils.java"
    type "file"
  ]
  node [
    id 75
    label "../src\test\java\org\springframework\samples\petclinic\service\EntityUtils.java::getById"
    type "function"
    intent "READ"
    domain "entity"
    business_role "SERVICE"
  ]
  node [
    id 76
    label "../src\test\java\org\springframework\samples\petclinic\system\CrashControllerIntegrationTests.java"
    type "file"
  ]
  node [
    id 77
    label "../src\test\java\org\springframework\samples\petclinic\system\CrashControllerIntegrationTests.java::testTriggerExceptionJson"
    type "function"
    intent ""
    domain "Integration"
    business_role "CONTROLLER"
  ]
  node [
    id 78
    label "../src\test\java\org\springframework\samples\petclinic\system\CrashControllerTests.java"
    type "file"
  ]
  node [
    id 79
    label "../src\test\java\org\springframework\samples\petclinic\system\CrashControllerTests.java::CrashController"
    type "function"
    intent ""
    domain "test"
    business_role "CONTROLLER"
  ]
  node [
    id 80
    label "../src\test\java\org\springframework\samples\petclinic\system\I18nPropertiesSyncTest.java"
    type "file"
  ]
  node [
    id 81
    label "../src\test\java\org\springframework\samples\petclinic\system\I18nPropertiesSyncTest.java::checkNonInternationalizedStrings"
    type "function"
    intent ""
    domain "test"
    business_role "UNKNOWN"
  ]
  node [
    id 82
    label "../src\test\java\org\springframework\samples\petclinic\vet\VetControllerTests.java"
    type "file"
  ]
  node [
    id 83
    label "../src\test\java\org\springframework\samples\petclinic\vet\VetControllerTests.java::james"
    type "function"
    intent ""
    domain "test"
    business_role "CONTROLLER"
  ]
  node [
    id 84
    label "../src\test\java\org\springframework\samples\petclinic\vet\VetTests.java"
    type "file"
  ]
  node [
    id 85
    label "../src\test\java\org\springframework\samples\petclinic\vet\VetTests.java::testSerialization"
    type "function"
    intent ""
    domain "@author"
    business_role "UNKNOWN"
  ]
  edge [
    source 0
    target 1
    relation "contains"
  ]
  edge [
    source 2
    target 3
    relation "contains"
  ]
  edge [
    source 4
    target 5
    relation "contains"
  ]
  edge [
    source 6
    target 7
    relation "contains"
  ]
  edge [
    source 8
    target 9
    relation "contains"
  ]
  edge [
    source 10
    target 11
    relation "contains"
  ]
  edge [
    source 12
    target 13
    relation "contains"
  ]
  edge [
    source 14
    target 15
    relation "contains"
  ]
  edge [
    source 16
    target 17
    relation "contains"
  ]
  edge [
    source 18
    target 19
    relation "contains"
  ]
  edge [
    source 20
    target 21
    relation "contains"
  ]
  edge [
    source 22
    target 23
    relation "contains"
  ]
  edge [
    source 24
    target 25
    relation "contains"
  ]
  edge [
    source 26
    target 27
    relation "contains"
  ]
  edge [
    source 28
    target 29
    relation "contains"
  ]
  edge [
    source 30
    target 31
    relation "contains"
  ]
  edge [
    source 32
    target 33
    relation "contains"
  ]
  edge [
    source 34
    target 35
    relation "contains"
  ]
  edge [
    source 36
    target 37
    relation "contains"
  ]
  edge [
    source 38
    target 39
    relation "contains"
  ]
  edge [
    source 40
    target 41
    relation "contains"
  ]
  edge [
    source 42
    target 43
    relation "contains"
  ]
  edge [
    source 44
    target 45
    relation "contains"
  ]
  edge [
    source 46
    target 47
    relation "contains"
  ]
  edge [
    source 48
    target 49
    relation "contains"
  ]
  edge [
    source 50
    target 51
    relation "contains"
  ]
  edge [
    source 52
    target 53
    relation "contains"
  ]
  edge [
    source 54
    target 55
    relation "contains"
  ]
  edge [
    source 56
    target 57
    relation "contains"
  ]
  edge [
    source 58
    target 59
    relation "contains"
  ]
  edge [
    source 60
    target 61
    relation "contains"
  ]
  edge [
    source 62
    target 63
    relation "contains"
  ]
  edge [
    source 64
    target 65
    relation "contains"
  ]
  edge [
    source 66
    target 67
    relation "contains"
  ]
  edge [
    source 68
    target 69
    relation "contains"
  ]
  edge [
    source 70
    target 71
    relation "contains"
  ]
  edge [
    source 72
    target 73
    relation "contains"
  ]
  edge [
    source 74
    target 75
    relation "contains"
  ]
  edge [
    source 76
    target 77
    relation "contains"
  ]
  edge [
    source 78
    target 79
    relation "contains"
  ]
  edge [
    source 80
    target 81
    relation "contains"
  ]
  edge [
    source 82
    target 83
    relation "contains"
  ]
  edge [
    source 84
    target 85
    relation "contains"
  ]
]
