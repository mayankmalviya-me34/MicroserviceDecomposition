graph [
  directed 1
  node [
    id 0
    label "controller::OwnerController"
    type "controller"
    domain "owner"
    file "../src\main\java\org\springframework\samples\petclinic\owner\OwnerController.java"
  ]
  node [
    id 1
    label "method::OwnerController::setAllowedFields"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 2
    label "method::OwnerController::findOwner"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 3
    label "method::OwnerController::initCreationForm"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 4
    label "endpoint::GET::/owner/new"
    type "endpoint"
    http_method "GET"
    path "/owner/new"
  ]
  node [
    id 5
    label "method::OwnerController::processCreationForm"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 6
    label "endpoint::POST::/owner/new"
    type "endpoint"
    http_method "POST"
    path "/owner/new"
  ]
  node [
    id 7
    label "method::OwnerController::initFindForm"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 8
    label "endpoint::GET::/owner/find"
    type "endpoint"
    http_method "GET"
    path "/owner/find"
  ]
  node [
    id 9
    label "method::OwnerController::processFindForm"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 10
    label "endpoint::GET::/owner"
    type "endpoint"
    http_method "GET"
    path "/owner"
  ]
  node [
    id 11
    label "method::OwnerController::addPaginationModel"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 12
    label "method::OwnerController::findPaginatedForOwnersLastName"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 13
    label "method::OwnerController::initUpdateOwnerForm"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 14
    label "endpoint::GET::/owner/{id}/edit"
    type "endpoint"
    http_method "GET"
    path "/owner/{id}/edit"
  ]
  node [
    id 15
    label "method::OwnerController::processUpdateOwnerForm"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 16
    label "endpoint::PUT::/owner/{id}/edit"
    type "endpoint"
    http_method "PUT"
    path "/owner/{id}/edit"
  ]
  node [
    id 17
    label "method::OwnerController::showOwner"
    type "handler"
    controller "OwnerController"
    domain "owner"
  ]
  node [
    id 18
    label "endpoint::GET::/owner/{id}"
    type "endpoint"
    http_method "GET"
    path "/owner/{id}"
  ]
  node [
    id 19
    label "controller::PetController"
    type "controller"
    domain "pet"
    file "../src\main\java\org\springframework\samples\petclinic\owner\PetController.java"
  ]
  node [
    id 20
    label "method::PetController::populatePetTypes"
    type "handler"
    controller "PetController"
    domain "pet"
  ]
  node [
    id 21
    label "method::PetController::findOwner"
    type "handler"
    controller "PetController"
    domain "pet"
  ]
  node [
    id 22
    label "method::PetController::findPet"
    type "handler"
    controller "PetController"
    domain "pet"
  ]
  node [
    id 23
    label "method::PetController::initOwnerBinder"
    type "handler"
    controller "PetController"
    domain "pet"
  ]
  node [
    id 24
    label "method::PetController::initPetBinder"
    type "handler"
    controller "PetController"
    domain "pet"
  ]
  node [
    id 25
    label "method::PetController::initCreationForm"
    type "handler"
    controller "PetController"
    domain "pet"
  ]
  node [
    id 26
    label "endpoint::GET::/pet/new"
    type "endpoint"
    http_method "GET"
    path "/pet/new"
  ]
  node [
    id 27
    label "method::PetController::processCreationForm"
    type "handler"
    controller "PetController"
    domain "pet"
  ]
  node [
    id 28
    label "endpoint::POST::/pet/new"
    type "endpoint"
    http_method "POST"
    path "/pet/new"
  ]
  node [
    id 29
    label "method::PetController::initUpdateForm"
    type "handler"
    controller "PetController"
    domain "pet"
  ]
  node [
    id 30
    label "endpoint::GET::/pet/{id}/edit"
    type "endpoint"
    http_method "GET"
    path "/pet/{id}/edit"
  ]
  node [
    id 31
    label "method::PetController::processUpdateForm"
    type "handler"
    controller "PetController"
    domain "pet"
  ]
  node [
    id 32
    label "endpoint::PUT::/pet/{id}/edit"
    type "endpoint"
    http_method "PUT"
    path "/pet/{id}/edit"
  ]
  node [
    id 33
    label "method::PetController::updatePetDetails"
    type "handler"
    controller "PetController"
    domain "pet"
  ]
  node [
    id 34
    label "controller::VisitController"
    type "controller"
    domain "visit"
    file "../src\main\java\org\springframework\samples\petclinic\owner\VisitController.java"
  ]
  node [
    id 35
    label "method::VisitController::setAllowedFields"
    type "handler"
    controller "VisitController"
    domain "visit"
  ]
  node [
    id 36
    label "method::VisitController::loadPetWithVisit"
    type "handler"
    controller "VisitController"
    domain "visit"
  ]
  node [
    id 37
    label "method::VisitController::initNewVisitForm"
    type "handler"
    controller "VisitController"
    domain "visit"
  ]
  node [
    id 38
    label "endpoint::GET::/owners/{ownerId}/pets/{petId}/visits/new"
    type "endpoint"
    http_method "GET"
    path "/owners/{ownerId}/pets/{petId}/visits/new"
  ]
  node [
    id 39
    label "method::VisitController::processNewVisitForm"
    type "handler"
    controller "VisitController"
    domain "visit"
  ]
  node [
    id 40
    label "endpoint::POST::/owners/{ownerId}/pets/{petId}/visits/new"
    type "endpoint"
    http_method "POST"
    path "/owners/{ownerId}/pets/{petId}/visits/new"
  ]
  node [
    id 41
    label "controller::CrashController"
    type "controller"
    domain "crash"
    file "../src\main\java\org\springframework\samples\petclinic\system\CrashController.java"
  ]
  node [
    id 42
    label "method::CrashController::triggerException"
    type "handler"
    controller "CrashController"
    domain "crash"
  ]
  node [
    id 43
    label "endpoint::GET::/oups"
    type "endpoint"
    http_method "GET"
    path "/oups"
  ]
  node [
    id 44
    label "controller::WelcomeController"
    type "controller"
    domain "welcome"
    file "../src\main\java\org\springframework\samples\petclinic\system\WelcomeController.java"
  ]
  node [
    id 45
    label "method::WelcomeController::welcome"
    type "handler"
    controller "WelcomeController"
    domain "welcome"
  ]
  node [
    id 46
    label "endpoint::GET::/"
    type "endpoint"
    http_method "GET"
    path "/"
  ]
  node [
    id 47
    label "controller::VetController"
    type "controller"
    domain "vet"
    file "../src\main\java\org\springframework\samples\petclinic\vet\VetController.java"
  ]
  node [
    id 48
    label "method::VetController::showVetList"
    type "handler"
    controller "VetController"
    domain "vet"
  ]
  node [
    id 49
    label "endpoint::GET::/vets"
    type "endpoint"
    http_method "GET"
    path "/vets"
  ]
  node [
    id 50
    label "method::VetController::addPaginationModel"
    type "handler"
    controller "VetController"
    domain "vet"
  ]
  node [
    id 51
    label "method::VetController::findPaginated"
    type "handler"
    controller "VetController"
    domain "vet"
  ]
  node [
    id 52
    label "method::VetController::showResourcesVetList"
    type "handler"
    controller "VetController"
    domain "vet"
  ]
  node [
    id 53
    label "endpoint::GET::/vets.json"
    type "endpoint"
    http_method "GET"
    path "/vets.json"
  ]
  node [
    id 54
    label "controller::OwnerControllerTests"
    type "controller"
    domain "ownertests"
    file "../src\test\java\org\springframework\samples\petclinic\owner\OwnerControllerTests.java"
  ]
  node [
    id 55
    label "method::OwnerControllerTests::george"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 56
    label "method::OwnerControllerTests::setup"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 57
    label "method::OwnerControllerTests::testInitCreationForm"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 58
    label "method::OwnerControllerTests::testProcessCreationFormSuccess"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 59
    label "method::OwnerControllerTests::testProcessCreationFormHasErrors"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 60
    label "method::OwnerControllerTests::testInitFindForm"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 61
    label "method::OwnerControllerTests::testProcessFindFormSuccess"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 62
    label "method::OwnerControllerTests::testProcessFindFormByLastName"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 63
    label "method::OwnerControllerTests::testProcessFindFormNoOwnersFound"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 64
    label "method::OwnerControllerTests::testInitUpdateOwnerForm"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 65
    label "method::OwnerControllerTests::testProcessUpdateOwnerFormSuccess"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 66
    label "method::OwnerControllerTests::testProcessUpdateOwnerFormUnchangedSuccess"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 67
    label "method::OwnerControllerTests::testProcessUpdateOwnerFormHasErrors"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 68
    label "method::OwnerControllerTests::testShowOwner"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 69
    label "method::OwnerControllerTests::testProcessUpdateOwnerFormWithIdMismatch"
    type "handler"
    controller "OwnerControllerTests"
    domain "ownertests"
  ]
  node [
    id 70
    label "controller::PetControllerTests"
    type "controller"
    domain "pettests"
    file "../src\test\java\org\springframework\samples\petclinic\owner\PetControllerTests.java"
  ]
  node [
    id 71
    label "method::PetControllerTests::setup"
    type "handler"
    controller "PetControllerTests"
    domain "pettests"
  ]
  node [
    id 72
    label "method::PetControllerTests::testInitCreationForm"
    type "handler"
    controller "PetControllerTests"
    domain "pettests"
  ]
  node [
    id 73
    label "method::PetControllerTests::testProcessCreationFormSuccess"
    type "handler"
    controller "PetControllerTests"
    domain "pettests"
  ]
  node [
    id 74
    label "method::PetControllerTests::testProcessUpdateFormSuccess"
    type "handler"
    controller "PetControllerTests"
    domain "pettests"
  ]
  node [
    id 75
    label "controller::VisitControllerTests"
    type "controller"
    domain "visittests"
    file "../src\test\java\org\springframework\samples\petclinic\owner\VisitControllerTests.java"
  ]
  node [
    id 76
    label "method::VisitControllerTests::init"
    type "handler"
    controller "VisitControllerTests"
    domain "visittests"
  ]
  node [
    id 77
    label "method::VisitControllerTests::testInitNewVisitForm"
    type "handler"
    controller "VisitControllerTests"
    domain "visittests"
  ]
  node [
    id 78
    label "method::VisitControllerTests::testProcessNewVisitFormSuccess"
    type "handler"
    controller "VisitControllerTests"
    domain "visittests"
  ]
  node [
    id 79
    label "method::VisitControllerTests::testProcessNewVisitFormHasErrors"
    type "handler"
    controller "VisitControllerTests"
    domain "visittests"
  ]
  node [
    id 80
    label "controller::CrashControllerIntegrationTests"
    type "controller"
    domain "crashintegrationtests"
    file "../src\test\java\org\springframework\samples\petclinic\system\CrashControllerIntegrationTests.java"
  ]
  node [
    id 81
    label "method::CrashControllerIntegrationTests::testTriggerExceptionJson"
    type "handler"
    controller "CrashControllerIntegrationTests"
    domain "crashintegrationtests"
  ]
  node [
    id 82
    label "method::CrashControllerIntegrationTests::testTriggerExceptionHtml"
    type "handler"
    controller "CrashControllerIntegrationTests"
    domain "crashintegrationtests"
  ]
  node [
    id 83
    label "controller::CrashControllerTests"
    type "controller"
    domain "crashtests"
    file "../src\test\java\org\springframework\samples\petclinic\system\CrashControllerTests.java"
  ]
  node [
    id 84
    label "method::CrashControllerTests::testTriggerException"
    type "handler"
    controller "CrashControllerTests"
    domain "crashtests"
  ]
  node [
    id 85
    label "controller::VetControllerTests"
    type "controller"
    domain "vettests"
    file "../src\test\java\org\springframework\samples\petclinic\vet\VetControllerTests.java"
  ]
  node [
    id 86
    label "method::VetControllerTests::james"
    type "handler"
    controller "VetControllerTests"
    domain "vettests"
  ]
  node [
    id 87
    label "method::VetControllerTests::helen"
    type "handler"
    controller "VetControllerTests"
    domain "vettests"
  ]
  node [
    id 88
    label "method::VetControllerTests::setup"
    type "handler"
    controller "VetControllerTests"
    domain "vettests"
  ]
  node [
    id 89
    label "method::VetControllerTests::testShowVetListHtml"
    type "handler"
    controller "VetControllerTests"
    domain "vettests"
  ]
  node [
    id 90
    label "method::VetControllerTests::testShowResourcesVetList"
    type "handler"
    controller "VetControllerTests"
    domain "vettests"
  ]
  edge [
    source 0
    target 1
    relation "handles"
  ]
  edge [
    source 0
    target 2
    relation "handles"
  ]
  edge [
    source 0
    target 3
    relation "handles"
  ]
  edge [
    source 0
    target 5
    relation "handles"
  ]
  edge [
    source 0
    target 7
    relation "handles"
  ]
  edge [
    source 0
    target 9
    relation "handles"
  ]
  edge [
    source 0
    target 11
    relation "handles"
  ]
  edge [
    source 0
    target 12
    relation "handles"
  ]
  edge [
    source 0
    target 13
    relation "handles"
  ]
  edge [
    source 0
    target 15
    relation "handles"
  ]
  edge [
    source 0
    target 17
    relation "handles"
  ]
  edge [
    source 4
    target 3
    relation "routes_to"
  ]
  edge [
    source 6
    target 5
    relation "routes_to"
  ]
  edge [
    source 8
    target 7
    relation "routes_to"
  ]
  edge [
    source 10
    target 9
    relation "routes_to"
  ]
  edge [
    source 14
    target 13
    relation "routes_to"
  ]
  edge [
    source 16
    target 15
    relation "routes_to"
  ]
  edge [
    source 18
    target 17
    relation "routes_to"
  ]
  edge [
    source 19
    target 20
    relation "handles"
  ]
  edge [
    source 19
    target 21
    relation "handles"
  ]
  edge [
    source 19
    target 22
    relation "handles"
  ]
  edge [
    source 19
    target 23
    relation "handles"
  ]
  edge [
    source 19
    target 24
    relation "handles"
  ]
  edge [
    source 19
    target 25
    relation "handles"
  ]
  edge [
    source 19
    target 27
    relation "handles"
  ]
  edge [
    source 19
    target 29
    relation "handles"
  ]
  edge [
    source 19
    target 31
    relation "handles"
  ]
  edge [
    source 19
    target 33
    relation "handles"
  ]
  edge [
    source 26
    target 25
    relation "routes_to"
  ]
  edge [
    source 28
    target 27
    relation "routes_to"
  ]
  edge [
    source 30
    target 29
    relation "routes_to"
  ]
  edge [
    source 32
    target 31
    relation "routes_to"
  ]
  edge [
    source 34
    target 35
    relation "handles"
  ]
  edge [
    source 34
    target 36
    relation "handles"
  ]
  edge [
    source 34
    target 37
    relation "handles"
  ]
  edge [
    source 34
    target 39
    relation "handles"
  ]
  edge [
    source 38
    target 37
    relation "routes_to"
  ]
  edge [
    source 40
    target 39
    relation "routes_to"
  ]
  edge [
    source 41
    target 42
    relation "handles"
  ]
  edge [
    source 43
    target 42
    relation "routes_to"
  ]
  edge [
    source 44
    target 45
    relation "handles"
  ]
  edge [
    source 46
    target 45
    relation "routes_to"
  ]
  edge [
    source 47
    target 48
    relation "handles"
  ]
  edge [
    source 47
    target 50
    relation "handles"
  ]
  edge [
    source 47
    target 51
    relation "handles"
  ]
  edge [
    source 47
    target 52
    relation "handles"
  ]
  edge [
    source 49
    target 48
    relation "routes_to"
  ]
  edge [
    source 53
    target 52
    relation "routes_to"
  ]
  edge [
    source 54
    target 55
    relation "handles"
  ]
  edge [
    source 54
    target 56
    relation "handles"
  ]
  edge [
    source 54
    target 57
    relation "handles"
  ]
  edge [
    source 54
    target 58
    relation "handles"
  ]
  edge [
    source 54
    target 59
    relation "handles"
  ]
  edge [
    source 54
    target 60
    relation "handles"
  ]
  edge [
    source 54
    target 61
    relation "handles"
  ]
  edge [
    source 54
    target 62
    relation "handles"
  ]
  edge [
    source 54
    target 63
    relation "handles"
  ]
  edge [
    source 54
    target 64
    relation "handles"
  ]
  edge [
    source 54
    target 65
    relation "handles"
  ]
  edge [
    source 54
    target 66
    relation "handles"
  ]
  edge [
    source 54
    target 67
    relation "handles"
  ]
  edge [
    source 54
    target 68
    relation "handles"
  ]
  edge [
    source 54
    target 69
    relation "handles"
  ]
  edge [
    source 70
    target 71
    relation "handles"
  ]
  edge [
    source 70
    target 72
    relation "handles"
  ]
  edge [
    source 70
    target 73
    relation "handles"
  ]
  edge [
    source 70
    target 74
    relation "handles"
  ]
  edge [
    source 75
    target 76
    relation "handles"
  ]
  edge [
    source 75
    target 77
    relation "handles"
  ]
  edge [
    source 75
    target 78
    relation "handles"
  ]
  edge [
    source 75
    target 79
    relation "handles"
  ]
  edge [
    source 80
    target 81
    relation "handles"
  ]
  edge [
    source 80
    target 82
    relation "handles"
  ]
  edge [
    source 83
    target 84
    relation "handles"
  ]
  edge [
    source 85
    target 86
    relation "handles"
  ]
  edge [
    source 85
    target 87
    relation "handles"
  ]
  edge [
    source 85
    target 88
    relation "handles"
  ]
  edge [
    source 85
    target 89
    relation "handles"
  ]
  edge [
    source 85
    target 90
    relation "handles"
  ]
]
