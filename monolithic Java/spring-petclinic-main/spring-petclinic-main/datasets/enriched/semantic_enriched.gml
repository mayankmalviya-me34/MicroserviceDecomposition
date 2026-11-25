graph [
  directed 1
  node [
    id 0
    label "org.springframework.samples.petclinic.owner.Pet"
    function "Pet"
    intent ""
    domain_entity "Pet"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 1
    label "org.springframework.samples.petclinic.system.WebConfiguration"
    function "WebConfiguration"
    intent ""
    domain_entity "Web"
    named_entities "[&#34;WebConfiguration&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 2
    label "org.springframework.samples.petclinic.vet.VetController.showResourcesVetList"
    function "showResourcesVetList"
    intent "Read"
    domain_entity "Resources"
    named_entities "[]"
    business_role "Resources Read Service"
    code ""
  ]
  node [
    id 3
    label "org.springframework.samples.petclinic.owner.PetController.initOwnerBinder"
    function "initOwnerBinder"
    intent "Create"
    domain_entity "Owner"
    named_entities "[]"
    business_role "Owner Create Service"
    code ""
  ]
  node [
    id 4
    label "org.springframework.samples.petclinic.owner.VisitController.initNewVisitForm"
    function "initNewVisitForm"
    intent "Create"
    domain_entity "New"
    named_entities "[]"
    business_role "New Create Service"
    code ""
  ]
  node [
    id 5
    label "org.springframework.samples.petclinic.owner.Visit"
    function "Visit"
    intent ""
    domain_entity "Visit"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 6
    label "org.springframework.samples.petclinic.vet.VetController.addPaginationModel"
    function "addPaginationModel"
    intent "Create"
    domain_entity "Pagination"
    named_entities "[]"
    business_role "Pagination Create Service"
    code ""
  ]
  node [
    id 7
    label "org.springframework.samples.petclinic.system.WebConfiguration.addInterceptors"
    function "addInterceptors"
    intent "Create"
    domain_entity "Interceptors"
    named_entities "[&#34;addInterceptors&#34;]"
    business_role "Interceptors Create Service"
    code ""
  ]
  node [
    id 8
    label "org.springframework.samples.petclinic.owner.PetController.populatePetTypes"
    function "populatePetTypes"
    intent ""
    domain_entity "Pet"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 9
    label "tools.PetClinicGraphExtractor.exportStaticGraphGML"
    function "exportStaticGraphGML"
    intent ""
    domain_entity "Static"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 10
    label "org.springframework.samples.petclinic.owner.PetValidator"
    function "PetValidator"
    intent ""
    domain_entity "Pet"
    named_entities "[&#34;PetValidator&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 11
    label "org.springframework.samples.petclinic.owner.OwnerController.processUpdateOwnerForm"
    function "processUpdateOwnerForm"
    intent "Update"
    domain_entity "Owner"
    named_entities "[]"
    business_role "Owner Update Service"
    code ""
  ]
  node [
    id 12
    label "org.springframework.samples.petclinic.model.BaseEntity.getId"
    function "getId"
    intent "Read"
    domain_entity "Id"
    named_entities "[&#34;getId&#34;]"
    business_role "Id Read Service"
    code ""
  ]
  node [
    id 13
    label "org.springframework.samples.petclinic.model.NamedEntity.setName"
    function "setName"
    intent "Update"
    domain_entity "Name"
    named_entities "[]"
    business_role "Name Update Service"
    code ""
  ]
  node [
    id 14
    label "org.springframework.samples.petclinic.PetClinicRuntimeHints.registerHints"
    function "registerHints"
    intent "Create"
    domain_entity "Hints"
    named_entities "[]"
    business_role "Hints Create Service"
    code ""
  ]
  node [
    id 15
    label "org.springframework.samples.petclinic.owner.Owner.getTelephone"
    function "getTelephone"
    intent "Read"
    domain_entity "Telephone"
    named_entities "[&#34;getTelephone&#34;]"
    business_role "Telephone Read Service"
    code ""
  ]
  node [
    id 16
    label "org.springframework.samples.petclinic.model.NamedEntity"
    function "NamedEntity"
    intent ""
    domain_entity "Named"
    named_entities "[&#34;NamedEntity&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 17
    label "org.springframework.samples.petclinic.vet.Vets"
    function "Vets"
    intent ""
    domain_entity "Vets"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 18
    label "org.springframework.samples.petclinic.owner.Owner.addVisit"
    function "addVisit"
    intent "Create"
    domain_entity "Visit"
    named_entities "[]"
    business_role "Visit Create Service"
    code ""
  ]
  node [
    id 19
    label "org.springframework.samples.petclinic.owner.PetController.findPet"
    function "findPet"
    intent "Read"
    domain_entity "Pet"
    named_entities "[]"
    business_role "Pet Read Service"
    code ""
  ]
  node [
    id 20
    label "org.springframework.samples.petclinic.owner.OwnerController.processFindForm"
    function "processFindForm"
    intent "Read"
    domain_entity "Form"
    named_entities "[]"
    business_role "Form Read Service"
    code ""
  ]
  node [
    id 21
    label "org.springframework.samples.petclinic.system.CrashController.triggerException"
    function "triggerException"
    intent ""
    domain_entity "Exception"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 22
    label "org.springframework.samples.petclinic.owner.OwnerController.showOwner"
    function "showOwner"
    intent "Read"
    domain_entity "Owner"
    named_entities "[]"
    business_role "Owner Read Service"
    code ""
  ]
  node [
    id 23
    label "org.springframework.samples.petclinic.owner.Owner.addPet"
    function "addPet"
    intent "Create"
    domain_entity "Pet"
    named_entities "[]"
    business_role "Pet Create Service"
    code ""
  ]
  node [
    id 24
    label "org.springframework.samples.petclinic.owner.Owner.getPet"
    function "getPet"
    intent "Read"
    domain_entity "Pet"
    named_entities "[]"
    business_role "Pet Read Service"
    code ""
  ]
  node [
    id 25
    label "org.springframework.samples.petclinic.owner.PetTypeRepository.findPetTypes"
    function "findPetTypes"
    intent "Read"
    domain_entity "Pet"
    named_entities "[]"
    business_role "Pet Read Service"
    code ""
  ]
  node [
    id 26
    label "org.springframework.samples.petclinic.vet.Vet"
    function "Vet"
    intent ""
    domain_entity "Vet"
    named_entities "[&#34;Vet&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 27
    label "org.springframework.samples.petclinic.model.BaseEntity.setId"
    function "setId"
    intent "Update"
    domain_entity "Id"
    named_entities "[]"
    business_role "Id Update Service"
    code ""
  ]
  node [
    id 28
    label "org.springframework.samples.petclinic.owner.PetController.initCreationForm"
    function "initCreationForm"
    intent "Create"
    domain_entity "Creation"
    named_entities "[&#34;initCreationForm&#34;]"
    business_role "Creation Create Service"
    code ""
  ]
  node [
    id 29
    label "org.springframework.samples.petclinic.owner.Visit.getDate"
    function "getDate"
    intent "Read"
    domain_entity "Date"
    named_entities "[]"
    business_role "Date Read Service"
    code ""
  ]
  node [
    id 30
    label "org.springframework.samples.petclinic.model.Person.setFirstName"
    function "setFirstName"
    intent "Update"
    domain_entity "First"
    named_entities "[]"
    business_role "First Update Service"
    code ""
  ]
  node [
    id 31
    label "org.springframework.samples.petclinic.owner.Pet.addVisit"
    function "addVisit"
    intent "Create"
    domain_entity "Visit"
    named_entities "[]"
    business_role "Visit Create Service"
    code ""
  ]
  node [
    id 32
    label "org.springframework.samples.petclinic.owner.Owner.toString"
    function "toString"
    intent ""
    domain_entity "String"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 33
    label "org.springframework.samples.petclinic.owner.PetTypeFormatter"
    function "PetTypeFormatter"
    intent ""
    domain_entity "Pet"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 34
    label "org.springframework.samples.petclinic.vet.VetController"
    function "VetController"
    intent ""
    domain_entity "Vet"
    named_entities "[&#34;VetController&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 35
    label "org.springframework.samples.petclinic.owner.Owner.getPets"
    function "getPets"
    intent "Read"
    domain_entity "Pets"
    named_entities "[]"
    business_role "Pets Read Service"
    code ""
  ]
  node [
    id 36
    label "org.springframework.samples.petclinic.owner.Owner.setTelephone"
    function "setTelephone"
    intent "Update"
    domain_entity "Telephone"
    named_entities "[]"
    business_role "Telephone Update Service"
    code ""
  ]
  node [
    id 37
    label "org.springframework.samples.petclinic.owner.VisitController.processNewVisitForm"
    function "processNewVisitForm"
    intent ""
    domain_entity "New"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 38
    label "org.springframework.samples.petclinic.owner.Owner.setCity"
    function "setCity"
    intent "Update"
    domain_entity "City"
    named_entities "[]"
    business_role "City Update Service"
    code ""
  ]
  node [
    id 39
    label "org.springframework.samples.petclinic.model.BaseEntity"
    function "BaseEntity"
    intent ""
    domain_entity "Base"
    named_entities "[&#34;BaseEntity&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 40
    label "org.springframework.samples.petclinic.PetClinicApplication"
    function "PetClinicApplication"
    intent ""
    domain_entity "Pet"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 41
    label "org.springframework.samples.petclinic.owner.OwnerRepository"
    function "OwnerRepository"
    intent ""
    domain_entity "Owner"
    named_entities "[&#34;OwnerRepository&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 42
    label "tools.PetClinicGraphExtractor"
    function "PetClinicGraphExtractor"
    intent ""
    domain_entity "Pet"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 43
    label "org.springframework.samples.petclinic.owner.Owner"
    function "Owner"
    intent ""
    domain_entity "Owner"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 44
    label "org.springframework.samples.petclinic.owner.OwnerController.processCreationForm"
    function "processCreationForm"
    intent ""
    domain_entity "Creation"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 45
    label "org.springframework.samples.petclinic.model.Person"
    function "Person"
    intent ""
    domain_entity "Person"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 46
    label "org.springframework.samples.petclinic.owner.OwnerController.findPaginatedForOwnersLastName"
    function "findPaginatedForOwnersLastName"
    intent "Read"
    domain_entity "Paginated"
    named_entities "[]"
    business_role "Paginated Read Service"
    code ""
  ]
  node [
    id 47
    label "org.springframework.samples.petclinic.owner.OwnerRepository.findById"
    function "findById"
    intent "Read"
    domain_entity "By"
    named_entities "[]"
    business_role "By Read Service"
    code ""
  ]
  node [
    id 48
    label "org.springframework.samples.petclinic.owner.PetTypeRepository"
    function "PetTypeRepository"
    intent ""
    domain_entity "Pet"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 49
    label "org.springframework.samples.petclinic.owner.OwnerController"
    function "OwnerController"
    intent ""
    domain_entity "Owner"
    named_entities "[&#34;OwnerController&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 50
    label "org.springframework.samples.petclinic.model.Person.setLastName"
    function "setLastName"
    intent "Update"
    domain_entity "Last"
    named_entities "[]"
    business_role "Last Update Service"
    code ""
  ]
  node [
    id 51
    label "org.springframework.samples.petclinic.owner.Visit.setDate"
    function "setDate"
    intent "Update"
    domain_entity "Date"
    named_entities "[]"
    business_role "Date Update Service"
    code ""
  ]
  node [
    id 52
    label "org.springframework.samples.petclinic.owner.Visit.setDescription"
    function "setDescription"
    intent "Update"
    domain_entity "Description"
    named_entities "[]"
    business_role "Description Update Service"
    code ""
  ]
  node [
    id 53
    label "org.springframework.samples.petclinic.owner.OwnerController.initUpdateOwnerForm"
    function "initUpdateOwnerForm"
    intent "Create"
    domain_entity "Update"
    named_entities "[]"
    business_role "Update Create Service"
    code ""
  ]
  node [
    id 54
    label "org.springframework.samples.petclinic.owner.Pet.getType"
    function "getType"
    intent "Read"
    domain_entity "Type"
    named_entities "[]"
    business_role "Type Read Service"
    code ""
  ]
  node [
    id 55
    label "org.springframework.samples.petclinic.owner.Pet.setBirthDate"
    function "setBirthDate"
    intent "Update"
    domain_entity "Birth"
    named_entities "[]"
    business_role "Birth Update Service"
    code ""
  ]
  node [
    id 56
    label "org.springframework.samples.petclinic.system.CrashController"
    function "CrashController"
    intent ""
    domain_entity "Crash"
    named_entities "[&#34;CrashController&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 57
    label "tools.PetClinicGraphExtractor.exportSemanticJSON"
    function "exportSemanticJSON"
    intent ""
    domain_entity "Semantic"
    named_entities "[&#34;exportSemanticJSON&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 58
    label "org.springframework.samples.petclinic.owner.PetController.processUpdateForm"
    function "processUpdateForm"
    intent "Update"
    domain_entity "Form"
    named_entities "[]"
    business_role "Form Update Service"
    code ""
  ]
  node [
    id 59
    label "org.springframework.samples.petclinic.vet.Specialty"
    function "Specialty"
    intent ""
    domain_entity "Specialty"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 60
    label "org.springframework.samples.petclinic.system.WelcomeController.welcome"
    function "welcome"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 61
    label "org.springframework.samples.petclinic.vet.Vets.getVetList"
    function "getVetList"
    intent "Read"
    domain_entity "Vet"
    named_entities "[]"
    business_role "Vet Read Service"
    code ""
  ]
  node [
    id 62
    label "org.springframework.samples.petclinic.system.CacheConfiguration.petclinicCacheConfigurationCustomizer"
    function "petclinicCacheConfigurationCustomizer"
    intent ""
    domain_entity "Cache"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 63
    label "org.springframework.samples.petclinic.vet.VetController.findPaginated"
    function "findPaginated"
    intent "Read"
    domain_entity "Paginated"
    named_entities "[]"
    business_role "Paginated Read Service"
    code ""
  ]
  node [
    id 64
    label "org.springframework.samples.petclinic.owner.Visit.getDescription"
    function "getDescription"
    intent "Read"
    domain_entity "Description"
    named_entities "[]"
    business_role "Description Read Service"
    code ""
  ]
  node [
    id 65
    label "org.springframework.samples.petclinic.system.CacheConfiguration"
    function "CacheConfiguration"
    intent ""
    domain_entity "Cache"
    named_entities "[&#34;CacheConfiguration&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 66
    label "org.springframework.samples.petclinic.system.CacheConfiguration.cacheConfiguration"
    function "cacheConfiguration"
    intent ""
    domain_entity "Configuration"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 67
    label "org.springframework.samples.petclinic.owner.PetController.initPetBinder"
    function "initPetBinder"
    intent "Create"
    domain_entity "Pet"
    named_entities "[]"
    business_role "Pet Create Service"
    code ""
  ]
  node [
    id 68
    label "org.springframework.samples.petclinic.owner.OwnerController.initCreationForm"
    function "initCreationForm"
    intent "Create"
    domain_entity "Creation"
    named_entities "[&#34;initCreationForm&#34;]"
    business_role "Creation Create Service"
    code ""
  ]
  node [
    id 69
    label "org.springframework.samples.petclinic.PetClinicRuntimeHints"
    function "PetClinicRuntimeHints"
    intent ""
    domain_entity "Pet"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 70
    label "org.springframework.samples.petclinic.vet.Vet.getSpecialtiesInternal"
    function "getSpecialtiesInternal"
    intent "Read"
    domain_entity "Specialties"
    named_entities "[&#34;getSpecialtiesInternal&#34;]"
    business_role "Specialties Read Service"
    code ""
  ]
  node [
    id 71
    label "org.springframework.samples.petclinic.owner.PetController.initUpdateForm"
    function "initUpdateForm"
    intent "Create"
    domain_entity "Update"
    named_entities "[]"
    business_role "Update Create Service"
    code ""
  ]
  node [
    id 72
    label "org.springframework.samples.petclinic.owner.OwnerController.addPaginationModel"
    function "addPaginationModel"
    intent "Create"
    domain_entity "Pagination"
    named_entities "[]"
    business_role "Pagination Create Service"
    code ""
  ]
  node [
    id 73
    label "org.springframework.samples.petclinic.owner.VisitController.setAllowedFields"
    function "setAllowedFields"
    intent "Update"
    domain_entity "Allowed"
    named_entities "[]"
    business_role "Allowed Update Service"
    code ""
  ]
  node [
    id 74
    label "org.springframework.samples.petclinic.owner.PetValidator.validate"
    function "validate"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 75
    label "org.springframework.samples.petclinic.owner.Owner.getCity"
    function "getCity"
    intent "Read"
    domain_entity "City"
    named_entities "[]"
    business_role "City Read Service"
    code ""
  ]
  node [
    id 76
    label "org.springframework.samples.petclinic.model.NamedEntity.getName"
    function "getName"
    intent "Read"
    domain_entity "Name"
    named_entities "[]"
    business_role "Name Read Service"
    code ""
  ]
  node [
    id 77
    label "org.springframework.samples.petclinic.vet.VetRepository"
    function "VetRepository"
    intent ""
    domain_entity "Vet"
    named_entities "[&#34;VetRepository&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 78
    label "org.springframework.samples.petclinic.system.WelcomeController"
    function "WelcomeController"
    intent ""
    domain_entity "Welcome"
    named_entities "[&#34;WelcomeController&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 79
    label "org.springframework.samples.petclinic.owner.Pet.getBirthDate"
    function "getBirthDate"
    intent "Read"
    domain_entity "Birth"
    named_entities "[]"
    business_role "Birth Read Service"
    code ""
  ]
  node [
    id 80
    label "org.springframework.samples.petclinic.owner.Pet.getVisits"
    function "getVisits"
    intent "Read"
    domain_entity "Visits"
    named_entities "[]"
    business_role "Visits Read Service"
    code ""
  ]
  node [
    id 81
    label "org.springframework.samples.petclinic.owner.PetController.processCreationForm"
    function "processCreationForm"
    intent ""
    domain_entity "Creation"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 82
    label "org.springframework.samples.petclinic.owner.PetValidator.supports"
    function "supports"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 83
    label "tools.PetClinicGraphExtractor.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 84
    label "org.springframework.samples.petclinic.vet.Vet.getNrOfSpecialties"
    function "getNrOfSpecialties"
    intent "Read"
    domain_entity "Nr"
    named_entities "[]"
    business_role "Nr Read Service"
    code ""
  ]
  node [
    id 85
    label "org.springframework.samples.petclinic.model.Person.getLastName"
    function "getLastName"
    intent "Read"
    domain_entity "Last"
    named_entities "[]"
    business_role "Last Read Service"
    code ""
  ]
  node [
    id 86
    label "org.springframework.samples.petclinic.owner.PetType"
    function "PetType"
    intent ""
    domain_entity "Pet"
    named_entities "[&#34;PetType&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 87
    label "org.springframework.samples.petclinic.model.NamedEntity.toString"
    function "toString"
    intent ""
    domain_entity "String"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 88
    label "org.springframework.samples.petclinic.vet.VetController.showVetList"
    function "showVetList"
    intent "Read"
    domain_entity "Vet"
    named_entities "[]"
    business_role "Vet Read Service"
    code ""
  ]
  node [
    id 89
    label "org.springframework.samples.petclinic.owner.PetController.findOwner"
    function "findOwner"
    intent "Read"
    domain_entity "Owner"
    named_entities "[]"
    business_role "Owner Read Service"
    code ""
  ]
  node [
    id 90
    label "org.springframework.samples.petclinic.PetClinicApplication.main"
    function "main"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 91
    label "org.springframework.samples.petclinic.model.BaseEntity.isNew"
    function "isNew"
    intent ""
    domain_entity "New"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 92
    label "tools.PetClinicGraphExtractor.parseFile"
    function "parseFile"
    intent ""
    domain_entity "File"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 93
    label "org.springframework.samples.petclinic.owner.PetTypeFormatter.parse"
    function "parse"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 94
    label "org.springframework.samples.petclinic.owner.OwnerRepository.findByLastNameStartingWith"
    function "findByLastNameStartingWith"
    intent "Read"
    domain_entity "By"
    named_entities "[]"
    business_role "By Read Service"
    code ""
  ]
  node [
    id 95
    label "org.springframework.samples.petclinic.system.WebConfiguration.localeResolver"
    function "localeResolver"
    intent ""
    domain_entity "Resolver"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 96
    label "org.springframework.samples.petclinic.owner.Owner.setAddress"
    function "setAddress"
    intent "Update"
    domain_entity "Address"
    named_entities "[&#34;setAddress&#34;]"
    business_role "Address Update Service"
    code ""
  ]
  node [
    id 97
    label "org.springframework.samples.petclinic.owner.VisitController"
    function "VisitController"
    intent ""
    domain_entity "Visit"
    named_entities "[&#34;VisitController&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 98
    label "org.springframework.samples.petclinic.owner.PetController.updatePetDetails"
    function "updatePetDetails"
    intent "Update"
    domain_entity "Pet"
    named_entities "[&#34;updatePetDetails&#34;]"
    business_role "Pet Update Service"
    code ""
  ]
  node [
    id 99
    label "org.springframework.samples.petclinic.owner.OwnerController.initFindForm"
    function "initFindForm"
    intent "Create"
    domain_entity "Find"
    named_entities "[]"
    business_role "Find Create Service"
    code ""
  ]
  node [
    id 100
    label "org.springframework.samples.petclinic.owner.PetTypeFormatter.print"
    function "print"
    intent ""
    domain_entity ""
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 101
    label "tools.PetClinicGraphExtractor.exportSemanticGraphML"
    function "exportSemanticGraphML"
    intent ""
    domain_entity "Semantic"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 102
    label "org.springframework.samples.petclinic.vet.Vet.getSpecialties"
    function "getSpecialties"
    intent "Read"
    domain_entity "Specialties"
    named_entities "[]"
    business_role "Specialties Read Service"
    code ""
  ]
  node [
    id 103
    label "org.springframework.samples.petclinic.model.Person.getFirstName"
    function "getFirstName"
    intent "Read"
    domain_entity "First"
    named_entities "[]"
    business_role "First Read Service"
    code ""
  ]
  node [
    id 104
    label "org.springframework.samples.petclinic.owner.VisitController.loadPetWithVisit"
    function "loadPetWithVisit"
    intent ""
    domain_entity "Pet"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 105
    label "org.springframework.samples.petclinic.owner.OwnerController.findOwner"
    function "findOwner"
    intent "Read"
    domain_entity "Owner"
    named_entities "[]"
    business_role "Owner Read Service"
    code ""
  ]
  node [
    id 106
    label "org.springframework.samples.petclinic.owner.Owner.getAddress"
    function "getAddress"
    intent "Read"
    domain_entity "Address"
    named_entities "[]"
    business_role "Address Read Service"
    code ""
  ]
  node [
    id 107
    label "org.springframework.samples.petclinic.owner.PetController"
    function "PetController"
    intent ""
    domain_entity "Pet"
    named_entities "[&#34;PetController&#34;]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 108
    label "org.springframework.samples.petclinic.owner.OwnerController.setAllowedFields"
    function "setAllowedFields"
    intent "Update"
    domain_entity "Allowed"
    named_entities "[]"
    business_role "Allowed Update Service"
    code ""
  ]
  node [
    id 109
    label "org.springframework.samples.petclinic.vet.VetRepository.findAll"
    function "findAll"
    intent "Read"
    domain_entity "All"
    named_entities "[]"
    business_role "All Read Service"
    code ""
  ]
  node [
    id 110
    label "org.springframework.samples.petclinic.system.WebConfiguration.localeChangeInterceptor"
    function "localeChangeInterceptor"
    intent ""
    domain_entity "Change"
    named_entities "[]"
    business_role "General Processing"
    code ""
  ]
  node [
    id 111
    label "org.springframework.samples.petclinic.vet.Vet.addSpecialty"
    function "addSpecialty"
    intent "Create"
    domain_entity "Specialty"
    named_entities "[]"
    business_role "Specialty Create Service"
    code ""
  ]
  node [
    id 112
    label "org.springframework.samples.petclinic.owner.Pet.setType"
    function "setType"
    intent "Update"
    domain_entity "Type"
    named_entities "[]"
    business_role "Type Update Service"
    code ""
  ]
  edge [
    source 7
    target 110
  ]
  edge [
    source 18
    target 24
  ]
  edge [
    source 18
    target 18
  ]
  edge [
    source 20
    target 72
  ]
  edge [
    source 20
    target 46
  ]
  edge [
    source 23
    target 35
  ]
  edge [
    source 24
    target 24
  ]
  edge [
    source 24
    target 35
  ]
  edge [
    source 31
    target 80
  ]
  edge [
    source 32
    target 32
  ]
  edge [
    source 58
    target 98
  ]
  edge [
    source 62
    target 66
  ]
  edge [
    source 83
    target 9
  ]
  edge [
    source 83
    target 92
  ]
  edge [
    source 83
    target 57
  ]
  edge [
    source 83
    target 101
  ]
  edge [
    source 84
    target 70
  ]
  edge [
    source 87
    target 76
  ]
  edge [
    source 88
    target 6
  ]
  edge [
    source 88
    target 63
  ]
  edge [
    source 102
    target 70
  ]
  edge [
    source 111
    target 70
  ]
]
