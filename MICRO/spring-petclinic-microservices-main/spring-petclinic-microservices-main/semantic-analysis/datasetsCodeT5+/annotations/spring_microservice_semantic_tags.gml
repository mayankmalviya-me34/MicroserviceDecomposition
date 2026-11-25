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
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "APPLICATION"
    llm_hint "&#10;*/&#10;&#10;import org.springframework.beans.factory.annotation.Autowired;&#10;import org.springframework.boot."
  ]
  node [
    id 2
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java"
    type "file"
  ]
  node [
    id 3
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java::main"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "APPLICATION"
    llm_hint "&#10;*/&#10;&#10;var ApiGatewayApplication = (function () {&#10;    function ApiGatewayApplication() {&#10;    }&#10;&#10;    Ap"
  ]
  node [
    id 4
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java::loadBalancedRestTemplate"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "APPLICATION"
    llm_hint "&#10;*/&#10;&#10;var ApiGatewayApplication = (function () {&#10;    function ApiGatewayApplication() {&#10;    }&#10;&#10;    Ap"
  ]
  node [
    id 5
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java::loadBalancedWebClientBuilder"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "APPLICATION"
    llm_hint "&#10;*/&#10;&#10;var ApiGatewayApplication = (function () {&#10;    function ApiGatewayApplication() {&#10;    }&#10;&#10;    Ap"
  ]
  node [
    id 6
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java::routerFunction"
    type "method"
    intent "UNKNOWN"
    domain "workaround"
    business_role "APPLICATION"
    llm_hint "/*&#10; * Copyright (c) 2008-2021, Hazelcast, Inc. All Rights Reserved.&#10; *&#10; * Licensed under the Apache "
  ]
  node [
    id 7
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\ApiGatewayApplication.java::defaultCustomizer"
    type "method"
    intent "UNKNOWN"
    domain "default"
    business_role "APPLICATION"
    llm_hint "&#10;What is this method do?&#10;&#10;What does this method do?&#10;&#10;What does this method do?&#10;&#10;What does this metho"
  ]
  node [
    id 8
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\CustomersServiceClient.java"
    type "file"
  ]
  node [
    id 9
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\CustomersServiceClient.java::getOwner"
    type "method"
    intent "READ"
    domain "maciej"
    business_role "SERVICE"
    llm_hint "&#10;What is the owner of this class?&#10;&#10;What is the owner of this class?&#10;&#10;What is the owner of this class"
  ]
  node [
    id 10
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\VisitsServiceClient.java"
    type "file"
  ]
  node [
    id 11
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\VisitsServiceClient.java::getVisitsForPets"
    type "method"
    intent "READ"
    domain "maciej"
    business_role "SERVICE"
    llm_hint "&#10;*/&#10;&#10;var VisitsServiceClient = function() {&#10;&#10;&#9;// Constructor&#10;&#9;this.getVisitsForPets = function() {&#10;&#10;"
  ]
  node [
    id 12
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\VisitsServiceClient.java::joinIds"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "SERVICE"
    llm_hint "&#10;Author: Maciej Szarlinski&#10;*/&#10;&#10;var VisitsServiceClient = function() {&#10;&#10;    var self = this;&#10;&#10;    sel"
  ]
  node [
    id 13
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\application\VisitsServiceClient.java::setHostname"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "SERVICE"
    llm_hint "&#10;*/&#10;&#10;var VisitsServiceClient = function(hostname) {&#10;&#9;this.hostname = hostname;&#10;&#9;this.setHostname = f"
  ]
  node [
    id 14
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayController.java"
    type "file"
  ]
  node [
    id 15
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayController.java::getOwnerDetails"
    type "method"
    intent "READ"
    domain "maciej"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var ApiGatewayController = {&#10;    getOwnerDetails: function(req, res, next) {&#10;        var owner "
  ]
  node [
    id 16
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayController.java::addVisitsToOwner"
    type "method"
    intent "CREATE"
    domain "maciej"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var ApiGatewayController = {&#10;    addVisitsToOwner: function(visitsToOwner) {&#10;        var self ="
  ]
  node [
    id 17
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayController.java::emptyVisitsForPets"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "CONTROLLER"
    llm_hint "&#65279;using System;&#10;using System.Collections.Generic;&#10;using System.Linq;&#10;using System.Text;&#10;using System."
  ]
  node [
    id 18
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\boundary\web\FallbackController.java"
    type "file"
  ]
  node [
    id 19
    label "spring-petclinic-api-gateway\src\main\java\org\springframework\samples\petclinic\api\boundary\web\FallbackController.java::fallback"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var FallbackController = Backbone.Controller.extend({&#10;&#9;initialize: function() {&#10;&#9;&#9;this.fallback"
  ]
  node [
    id 20
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\ApiGatewayApplicationTests.java"
    type "file"
  ]
  node [
    id 21
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\ApiGatewayApplicationTests.java::contextLoads"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "APPLICATION"
    llm_hint " &#10;What is the name of the method?&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 22
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\application\VisitsServiceClientIntegrationTest.java"
    type "file"
  ]
  node [
    id 23
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\application\VisitsServiceClientIntegrationTest.java::setUp"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "SERVICE"
    llm_hint ".&#10;*/&#10;&#10;var VisitsServiceClientIntegrationTest = require('../../../../../../test/integration/visitsSer"
  ]
  node [
    id 24
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\application\VisitsServiceClientIntegrationTest.java::shutdown"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "SERVICE"
    llm_hint "&#10;*/&#10;&#10;var VisitsServiceClientIntegrationTest = Class.create(VisitsServiceClientIntegrationTest, {&#10;&#10;&#9;/"
  ]
  node [
    id 25
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\application\VisitsServiceClientIntegrationTest.java::getVisitsForPets_withAvailableVisitsService"
    type "method"
    intent "READ"
    domain ""
    business_role "SERVICE"
    llm_hint "&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 26
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\application\VisitsServiceClientIntegrationTest.java::assertVisitDescriptionEquals"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "SERVICE"
    llm_hint "&#10;What is the description of the visit?&#10;*/&#10;&#10;var VisitsServiceClientIntegrationTest = {&#10;&#10;    setUp: fu"
  ]
  node [
    id 27
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\application\VisitsServiceClientIntegrationTest.java::prepareResponse"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "SERVICE"
    llm_hint "&#10;What is the response from the server?&#10;*/&#10;&#10;var VisitsServiceClientIntegrationTest = function() {&#10;&#10;  "
  ]
  node [
    id 28
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayControllerTest.java"
    type "file"
  ]
  node [
    id 29
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayControllerTest.java::getOwnerDetails_withAvailableVisitsService"
    type "method"
    intent "READ"
    domain "test"
    business_role "CONTROLLER"
    llm_hint "&#65279;using System;&#10;using System.Collections.Generic;&#10;using System.Linq;&#10;using System.Text;&#10;using System."
  ]
  node [
    id 30
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\boundary\web\ApiGatewayControllerTest.java::getOwnerDetails_withServiceError"
    type "method"
    intent "READ"
    domain "test"
    business_role "CONTROLLER"
    llm_hint "&#65279;using System;&#10;using System.Collections.Generic;&#10;using System.Linq;&#10;using System.Text;&#10;using System."
  ]
  node [
    id 31
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\boundary\web\CircuitBreakerConfiguration.java"
    type "file"
  ]
  node [
    id 32
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\boundary\web\CircuitBreakerConfiguration.java::circuitBreakerRegistry"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "COMPONENT"
    llm_hint "&#10;*/&#10;&#10;var CircuitBreakerConfiguration = (function () {&#10;    function CircuitBreakerConfiguration() {&#10; "
  ]
  node [
    id 33
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\boundary\web\CircuitBreakerConfiguration.java::timeLimiterRegistry"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "COMPONENT"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 34
    label "spring-petclinic-api-gateway\src\test\java\org\springframework\samples\petclinic\api\boundary\web\CircuitBreakerConfiguration.java::resilience4JConfigurationProperties"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "COMPONENT"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 35
    label "spring-petclinic-config-server\src\main\java\org\springframework\samples\petclinic\config\ConfigServerApplication.java"
    type "file"
  ]
  node [
    id 36
    label "spring-petclinic-config-server\src\main\java\org\springframework\samples\petclinic\config\ConfigServerApplication.java::main"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "COMPONENT"
    llm_hint "&#10;*/&#10;&#10;#include &#34;ConfigServerApplication.h&#34;&#10;#include &#34;ConfigServerApplication.h&#34;&#10;#include &#34;ConfigServe"
  ]
  node [
    id 37
    label "spring-petclinic-config-server\src\test\java\org\springframework\samples\petclinic\config\PetclinicConfigServerApplicationTests.java"
    type "file"
  ]
  node [
    id 38
    label "spring-petclinic-config-server\src\test\java\org\springframework\samples\petclinic\config\PetclinicConfigServerApplicationTests.java::contextLoads"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "COMPONENT"
    llm_hint "&#10;*/&#10;&#10;#include &#34;PetclinicConfigServerApplicationTests.h&#34;&#10;#include &#34;PetclinicConfigServerApplication.h"
  ]
  node [
    id 39
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\CustomersServiceApplication.java"
    type "file"
  ]
  node [
    id 40
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\CustomersServiceApplication.java::main"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "SERVICE"
    llm_hint "&#10;*/&#10;&#10;var CustomersServiceApplication = (function () {&#10;    function CustomersServiceApplication() {&#10; "
  ]
  node [
    id 41
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\config\MetricConfig.java"
    type "file"
  ]
  node [
    id 42
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\config\MetricConfig.java::metricsCommonTags"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "COMPONENT"
    llm_hint "&#10;*/&#10;&#10;var MetricConfig = function() {&#10;&#10;&#9;var config = {};&#10;&#10;&#9;config.metricsCommonTags = [];&#10;&#10;&#9;config.me"
  ]
  node [
    id 43
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\config\MetricConfig.java::timedAspect"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "COMPONENT"
    llm_hint "&#10;*/&#10;class MetricConfig {&#10;    constructor(config) {&#10;        this.config = config;&#10;    }&#10;&#10;    /**&#10;    "
  ]
  node [
    id 44
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java"
    type "file"
  ]
  node [
    id 45
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getPetsInternal"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;package org.sakaiproject.entity;&#10;&#10;import java.util.List;&#10;&#10;import org.sakaiproject.entity.api.En"
  ]
  node [
    id 46
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getPets"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the owner's name?&#10;&#10;Owner&#10;&#10;What is the owner's age?&#10;&#10;Owner&#10;&#10;What is the owner's gender?&#10;&#10;Ow"
  ]
  node [
    id 47
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::addPet"
    type "method"
    intent "CREATE"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 48
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::toString"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the owner class?&#10;&#10;Owner is a JavaBean domain object representing an owner.&#10;&#10;@author Ken Kr"
  ]
  node [
    id 49
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getId"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;Simple JavaBean domain object representing an owner.&#10;&#10;@author Ken Krebs&#10;@auth"
  ]
  node [
    id 50
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getFirstName"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the first name of an owner?&#10;&#10;The first name of an owner is the first name of the owner.&#10;&#10;W"
  ]
  node [
    id 51
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getLastName"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the last name of an owner?&#10;&#10;The last name of an owner is the name of the owner who is the "
  ]
  node [
    id 52
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getAddress"
    type "method"
    intent "CREATE"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "/*&#10; * Copyright (c) 2008-2021, Hazelcast, Inc. All Rights Reserved.&#10; *&#10; * Licensed under the Apache "
  ]
  node [
    id 53
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getCity"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the owner class?&#10;&#10;Owner is a simple JavaBean domain object representing an owner.&#10;&#10;@author"
  ]
  node [
    id 54
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::getTelephone"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;var Owner = (function() {&#10;    function Owner() {&#10;    }&#10;&#10;    Owner.getTelephone = function() {&#10; "
  ]
  node [
    id 55
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::setFirstName"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the first name of an owner?&#10;&#10;The first name of an owner is the first name of the owner.&#10;&#10;W"
  ]
  node [
    id 56
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::setLastName"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the last name of an owner?&#10;&#10;The last name of an owner is the name of the owner who was las"
  ]
  node [
    id 57
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::setAddress"
    type "method"
    intent "CREATE"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;Class: Owner&#10;Method: setAddress&#10;Comment: *&#10; * Simple JavaBean domain object r"
  ]
  node [
    id 58
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::setCity"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;package com.example;&#10;&#10;import java.util.ArrayList;&#10;import java.util.List;&#10;&#10;public class Owner {&#10;"
  ]
  node [
    id 59
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Owner.java::setTelephone"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;var Owner = (function() {&#10;    function Owner() {&#10;    }&#10;&#10;    Owner.prototype.setTelephone = func"
  ]
  node [
    id 60
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java"
    type "file"
  ]
  node [
    id 61
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::toString"
    type "method"
    intent "UNKNOWN"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;Class: Pet&#10;Method: toString&#10;Comment: *&#10; * Simple business object representing"
  ]
  node [
    id 62
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::getId"
    type "method"
    intent "READ"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;Class: Pet&#10;Method: getId&#10;Comment: *&#10; * Simple business object representing a "
  ]
  node [
    id 63
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::getName"
    type "method"
    intent "READ"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the name of a pet?&#10;&#10;What is the name of a pet?&#10;&#10;What is the name of a pet?&#10;&#10;What is the na"
  ]
  node [
    id 64
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::getBirthDate"
    type "method"
    intent "READ"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the getBirthDate method of a pet?&#10;&#10;What is the getBirthDate method of a pet?&#10;&#10;What is the "
  ]
  node [
    id 65
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::getType"
    type "method"
    intent "READ"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the type of a pet?&#10;&#10;The type of a pet is the type of a pet itself.&#10;&#10;What is the type of a "
  ]
  node [
    id 66
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::getOwner"
    type "method"
    intent "READ"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the owner of a pet?&#10;&#10;@author Ken Krebs&#10;@author Juergen Hoeller&#10;@author Sam Brannen&#10;@author"
  ]
  node [
    id 67
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::setId"
    type "method"
    intent "UNKNOWN"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;Class: Pet&#10;Method: setId&#10;Comment: *&#10; * Simple business object representing a "
  ]
  node [
    id 68
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::setName"
    type "method"
    intent "UNKNOWN"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the name of a pet?&#10;&#10;What is the name of a pet?&#10;&#10;What is the name of a pet?&#10;&#10;What is the na"
  ]
  node [
    id 69
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::setBirthDate"
    type "method"
    intent "UNKNOWN"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;Class: Pet&#10;Method: setBirthDate&#10;Comment: *&#10; * Simple business object represen"
  ]
  node [
    id 70
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::setType"
    type "method"
    intent "UNKNOWN"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the type of a pet?&#10;&#10;What is the type of a pet?&#10;&#10;What is the type of a pet?&#10;&#10;What is the ty"
  ]
  node [
    id 71
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::setOwner"
    type "method"
    intent "UNKNOWN"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 72
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::equals"
    type "method"
    intent "UNKNOWN"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;Class: Pet&#10;Method: equals&#10;Comment: *&#10; * Simple business object representing a"
  ]
  node [
    id 73
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\Pet.java::hashCode"
    type "method"
    intent "UNKNOWN"
    domain "business"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the hashCode method of a pet?&#10;&#10;What is the hashCode method of a pet?&#10;&#10;What is the hashCode"
  ]
  node [
    id 74
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\PetType.java"
    type "file"
  ]
  node [
    id 75
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\PetType.java::getId"
    type "method"
    intent "READ"
    domain "juergen"
    business_role "DOMAIN"
    llm_hint "&#10;What is the id of a PetType?&#10;&#10;What is the id of a PetType?&#10;&#10;What is the id of a PetType?&#10;&#10;What is t"
  ]
  node [
    id 76
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\PetType.java::getName"
    type "method"
    intent "READ"
    domain "juergen"
    business_role "DOMAIN"
    llm_hint "&#10;What is the name of this class?&#10;&#10;What is the name of the class?&#10;&#10;What is the name of the class?&#10;&#10;Wh"
  ]
  node [
    id 77
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\PetType.java::setId"
    type "method"
    intent "UNKNOWN"
    domain "juergen"
    business_role "DOMAIN"
    llm_hint "&#10;What is this class?&#10;&#10;What is this method?&#10;&#10;What is this method?&#10;&#10;What is this method?&#10;&#10;What is this"
  ]
  node [
    id 78
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\model\PetType.java::setName"
    type "method"
    intent "UNKNOWN"
    domain "juergen"
    business_role "DOMAIN"
    llm_hint "&#10;What is the name of this class?&#10;&#10;What is the description of this class?&#10;&#10;What is the description of"
  ]
  node [
    id 79
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\OwnerResource.java"
    type "file"
  ]
  node [
    id 80
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\OwnerResource.java::createOwner"
    type "method"
    intent "CREATE"
    domain "create"
    business_role "CONTROLLER"
    llm_hint "&#10;What is this method do?&#10;Create Owner&#10;*/&#10;&#10;var createOwner = function(owner) {&#10;    var ownerResource "
  ]
  node [
    id 81
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\OwnerResource.java::findOwner"
    type "method"
    intent "READ"
    domain "read"
    business_role "CONTROLLER"
    llm_hint "&#10;What does this method do?&#10;&#10;What does this method do?&#10;&#10;What does this method do?&#10;&#10;What does this met"
  ]
  node [
    id 82
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\OwnerResource.java::findAll"
    type "method"
    intent "READ"
    domain "read"
    business_role "CONTROLLER"
    llm_hint "&#10;What does this method do?&#10;&#10;What does this method do?&#10;&#10;What does this method do?&#10;&#10;What does this met"
  ]
  node [
    id 83
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\OwnerResource.java::updateOwner"
    type "method"
    intent "UPDATE"
    domain "update"
    business_role "CONTROLLER"
    llm_hint "&#10;What is this method do?&#10;&#10;Update Owner&#10;&#10;What is this method do?&#10;&#10;Update Owner&#10;&#10;What is this method d"
  ]
  node [
    id 84
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java"
    type "file"
  ]
  node [
    id 85
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::getPetTypes"
    type "method"
    intent "READ"
    domain "juergen"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var PetResource = function() {&#10;&#10;&#9;this.getPetTypes = function() {&#10;&#9;&#9;var petTypes = [];&#10;&#9;&#9;for (va"
  ]
  node [
    id 86
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::processCreationForm"
    type "method"
    intent "UNKNOWN"
    domain "juergen"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var PetResource = function() {&#10;&#9;this.name = &#34;PetResource&#34;;&#10;&#9;this.description = &#34;A PetResource i"
  ]
  node [
    id 87
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::processUpdateForm"
    type "method"
    intent "UPDATE"
    domain "juergen"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var PetResource = function() {&#10;&#9;this.id = &#34;petResource&#34;;&#10;&#9;this.name = &#34;PetResource&#34;;&#10;&#9;this.desc"
  ]
  node [
    id 88
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::save"
    type "method"
    intent "CREATE"
    domain "juergen"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;class PetResource {&#10;&#9;constructor() {&#10;&#9;&#9;this.name = &#34;PetResource&#34;;&#10;&#9;&#9;this.description = &#34;This is"
  ]
  node [
    id 89
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::findPet"
    type "method"
    intent "READ"
    domain "juergen"
    business_role "CONTROLLER"
    llm_hint "&#10;What is this method?&#10;&#10;What is this method?&#10;&#10;What is this method?&#10;&#10;What is this method?&#10;&#10;What is thi"
  ]
  node [
    id 90
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\PetResource.java::findPetById"
    type "method"
    intent "READ"
    domain "juergen"
    business_role "CONTROLLER"
    llm_hint "&#65279;using System;&#10;using System.Collections.Generic;&#10;using System.Linq;&#10;using System.Text;&#10;using System."
  ]
  node [
    id 91
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\mapper\OwnerEntityMapper.java"
    type "file"
  ]
  node [
    id 92
    label "spring-petclinic-customers-service\src\main\java\org\springframework\samples\petclinic\customers\web\mapper\OwnerEntityMapper.java::map"
    type "method"
    intent "UNKNOWN"
    domain "this"
    business_role "ENTITY"
    llm_hint ".&#10;What is this method do?&#10;What is this method do?&#10;What is this method do?&#10;What is this method do?&#10;Wh"
  ]
  node [
    id 93
    label "spring-petclinic-customers-service\src\test\java\org\springframework\samples\petclinic\customers\web\PetResourceTest.java"
    type "file"
  ]
  node [
    id 94
    label "spring-petclinic-customers-service\src\test\java\org\springframework\samples\petclinic\customers\web\PetResourceTest.java::shouldGetAPetInJSonFormat"
    type "method"
    intent "READ"
    domain "maciej"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var shouldGetAPetInJSonFormat = function(){&#10;&#9;var pet = new PetResource();&#10;&#9;var petResource = ne"
  ]
  node [
    id 95
    label "spring-petclinic-customers-service\src\test\java\org\springframework\samples\petclinic\customers\web\PetResourceTest.java::setupPet"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;#include &#34;PetResourceTest.h&#34;&#10;#include &#34;PetResource.h&#34;&#10;#include &#34;PetResourceTest.h&#34;&#10;#include &#34;Pe"
  ]
  node [
    id 96
    label "spring-petclinic-discovery-server\src\main\java\org\springframework\samples\petclinic\discovery\DiscoveryServerApplication.java"
    type "file"
  ]
  node [
    id 97
    label "spring-petclinic-discovery-server\src\main\java\org\springframework\samples\petclinic\discovery\DiscoveryServerApplication.java::main"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "APPLICATION"
    llm_hint "&#10;*/&#10;&#10;#include &#34;DiscoveryServerApplication.h&#34;&#10;#include &#34;DiscoveryServerApplication.h&#34;&#10;#include &#34;Disco"
  ]
  node [
    id 98
    label "spring-petclinic-discovery-server\src\test\java\org\springframework\samples\petclinic\discovery\DiscoveryServerApplicationTests.java"
    type "file"
  ]
  node [
    id 99
    label "spring-petclinic-discovery-server\src\test\java\org\springframework\samples\petclinic\discovery\DiscoveryServerApplicationTests.java::contextLoads"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "APPLICATION"
    llm_hint "&#10;Comment: &#10;What does this method do?&#10;*/&#10;&#10;var DiscoveryServerApplicationTests = {&#10;&#10;&#9;// Set up&#10;&#9;setup:"
  ]
  node [
    id 100
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIBeanConfiguration.java"
    type "file"
  ]
  node [
    id 101
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIBeanConfiguration.java::chatMemory"
    type "method"
    intent "UNKNOWN"
    domain "configuration"
    business_role "ENTITY"
    llm_hint "&#65279;using System;&#10;using System.Collections.Generic;&#10;using System.Linq;&#10;using System.Text;&#10;using System."
  ]
  node [
    id 102
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIBeanConfiguration.java::vectorStore"
    type "method"
    intent "UNKNOWN"
    domain "configuration"
    business_role "ENTITY"
    llm_hint "&#10;*/&#10;&#10;#include &#34;AIBeanConfiguration.h&#34;&#10;#include &#34;vectorStore.h&#34;&#10;#include <vector>&#10;#include <string>&#10;#"
  ]
  node [
    id 103
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIBeanConfiguration.java::loadBalancedWebClientBuilder"
    type "method"
    intent "UNKNOWN"
    domain "configuration"
    business_role "ENTITY"
    llm_hint "&#10;*/&#10;&#10;var AIBeanConfiguration = function() {&#10;&#10;    var AIBeanConfiguration = function() {&#10;&#10;        thi"
  ]
  node [
    id 104
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIDataProvider.java"
    type "file"
  ]
  node [
    id 105
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIDataProvider.java::getAllOwners"
    type "method"
    intent "CREATE"
    domain "functions"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;var AIDataProvider = function() {&#10;&#10;    var _this = this;&#10;&#10;    this.getAllOwners = function() {&#10;"
  ]
  node [
    id 106
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIDataProvider.java::getVets"
    type "method"
    intent "CREATE"
    domain "functions"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;var AIDataProvider = function() {&#10;&#10;    var _this = this;&#10;&#10;    this.getVets = function(query) {&#10;"
  ]
  node [
    id 107
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIDataProvider.java::addPetToOwner"
    type "method"
    intent "CREATE"
    domain "functions"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;var AIDataProvider = function() {&#10;&#10;&#9;var self = this;&#10;&#10;&#9;this.addPetToOwner = function(pet) {&#10;&#10;&#9;&#9;"
  ]
  node [
    id 108
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\AIDataProvider.java::addOwnerToPetclinic"
    type "method"
    intent "CREATE"
    domain "functions"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;var AIDataProvider = function() {&#10;&#10;&#9;var self = this;&#10;&#10;&#9;this.addOwnerToPetclinic = function(owne"
  ]
  node [
    id 109
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\GenAIServiceApplication.java"
    type "file"
  ]
  node [
    id 110
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\GenAIServiceApplication.java::main"
    type "method"
    intent "UNKNOWN"
    domain "oded"
    business_role "SERVICE"
    llm_hint "&#10;This program is free software: you can redistribute it and/or modify&#10;it under the terms of the GNU "
  ]
  node [
    id 111
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\VectorStoreController.java"
    type "file"
  ]
  node [
    id 112
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\VectorStoreController.java::loadVetDataToVectorStoreOnStartup"
    type "method"
    intent "UNKNOWN"
    domain "loads"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var VectorStoreController = (function() {&#10;    function VectorStoreController() {&#10;    }&#10;&#10;    Vec"
  ]
  node [
    id 113
    label "spring-petclinic-genai-service\src\main\java\org\springframework\samples\petclinic\genai\VectorStoreController.java::convertListToJsonResource"
    type "method"
    intent "UNKNOWN"
    domain "loads"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var VectorStoreController = Backbone.Controller.extend({&#10;&#10;&#9;initialize: function() {&#10;&#9;&#9;this.coll"
  ]
  node [
    id 114
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\VetsServiceApplication.java"
    type "file"
  ]
  node [
    id 115
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\VetsServiceApplication.java::main"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "SERVICE"
    llm_hint "&#10;*/&#10;&#10;var VetsServiceApplication = (function() {&#10;    function VetsServiceApplication() {&#10;    }&#10;&#10;    V"
  ]
  node [
    id 116
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Specialty.java"
    type "file"
  ]
  node [
    id 117
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Specialty.java::getId"
    type "method"
    intent "READ"
    domain "models"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;class Specialty {&#10;    constructor(id) {&#10;        this.id = id;&#10;    }&#10;&#10;    getId() {&#10;        retu"
  ]
  node [
    id 118
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Specialty.java::getName"
    type "method"
    intent "READ"
    domain "models"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;class Specialty {&#10;    constructor(name) {&#10;        this.name = name;&#10;    }&#10;&#10;    getName() {&#10;    "
  ]
  node [
    id 119
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Specialty.java::setName"
    type "method"
    intent "UNKNOWN"
    domain "models"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;class Specialty {&#10;    constructor(name) {&#10;        this.name = name;&#10;    }&#10;&#10;    setName(name) {&#10;"
  ]
  node [
    id 120
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java"
    type "file"
  ]
  node [
    id 121
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getSpecialtiesInternal"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class specifictiesInternal?&#10;&#10;This is a simple JavaBean domain object representing a v"
  ]
  node [
    id 122
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getSpecialties"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;Simple JavaBean domain object representing a veterinarian.&#10;&#10;@author Ken Krebs"
  ]
  node [
    id 123
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getNrOfSpecialties"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;This is a simple JavaBean domain object representing a veterinarian.&#10;&#10;@author"
  ]
  node [
    id 124
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::addSpecialty"
    type "method"
    intent "CREATE"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;Class: Vet&#10;Method: addSpecialty&#10;Comment: *&#10; * Simple JavaBean domain object r"
  ]
  node [
    id 125
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getId"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is this class?&#10;&#10;Simple JavaBean domain object representing a veterinarian.&#10;&#10;@author Ken Krebs"
  ]
  node [
    id 126
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getFirstName"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the first name of a veterinarian?&#10;&#10;What is the second name of a veterinarian?&#10;&#10;What is the"
  ]
  node [
    id 127
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::getLastName"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the last name of a veterinarian?&#10;&#10;What is the last name of a veterinarian?&#10;&#10;What is the la"
  ]
  node [
    id 128
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::setId"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the ID of a veterinarian?&#10;&#10;The ID of a veterinarian is the unique identifier of a veterina"
  ]
  node [
    id 129
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::setFirstName"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the first name of a veterinarian?&#10;&#10;What is the second name of a veterinarian?&#10;&#10;What is the"
  ]
  node [
    id 130
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\model\Vet.java::setLastName"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the last name of a veterinarian?&#10;&#10;What is the last name of a veterinarian?&#10;&#10;What is the la"
  ]
  node [
    id 131
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\web\VetResource.java"
    type "file"
  ]
  node [
    id 132
    label "spring-petclinic-vets-service\src\main\java\org\springframework\samples\petclinic\vets\web\VetResource.java::showResourcesVetList"
    type "method"
    intent "UNKNOWN"
    domain "juergen"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var VetResource = function() {&#10;&#10;&#9;this.showResourcesVetList = function() {&#10;&#10;&#9;&#9;$.ajax({&#10;&#10;&#9;&#9;&#9;url: "
  ]
  node [
    id 133
    label "spring-petclinic-vets-service\src\test\java\org\springframework\samples\petclinic\vets\web\VetResourceTest.java"
    type "file"
  ]
  node [
    id 134
    label "spring-petclinic-vets-service\src\test\java\org\springframework\samples\petclinic\vets\web\VetResourceTest.java::shouldGetAListOfVets"
    type "method"
    intent "READ"
    domain "maciej"
    business_role "CONTROLLER"
    llm_hint "&#10;Given: shouldGetAListOfVets&#10;Then: shouldGetAListOfVets should return a list of vets&#10;&#10;Class: VetReso"
  ]
  node [
    id 135
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\VisitsServiceApplication.java"
    type "file"
  ]
  node [
    id 136
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\VisitsServiceApplication.java::main"
    type "method"
    intent "UNKNOWN"
    domain "maciej"
    business_role "SERVICE"
    llm_hint "&#10;*/&#10;&#10;var VisitsServiceApplication = (function() {&#10;    function VisitsServiceApplication() {&#10;    }&#10;&#10; "
  ]
  node [
    id 137
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\config\MetricConfig.java"
    type "file"
  ]
  node [
    id 138
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\config\MetricConfig.java::metricsCommonTags"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "COMPONENT"
    llm_hint "&#10;*/&#10;&#10;var MetricConfig = function() {&#10;&#10;&#9;var config = {};&#10;&#10;&#9;config.metricsCommonTags = [];&#10;&#10;&#9;config.me"
  ]
  node [
    id 139
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\config\MetricConfig.java::timedAspect"
    type "method"
    intent "UNKNOWN"
    domain ""
    business_role "COMPONENT"
    llm_hint "&#10;*/&#10;class MetricConfig {&#10;    constructor(config) {&#10;        this.config = config;&#10;    }&#10;&#10;    /**&#10;    "
  ]
  node [
    id 140
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java"
    type "file"
  ]
  node [
    id 141
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::getId"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 142
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::getDate"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;&#10;What is the date of the visit?&#10;&#10;The date of the visit is the same as the date of the first visit.&#10;"
  ]
  node [
    id 143
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::getDescription"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 144
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::getPetId"
    type "method"
    intent "READ"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;public class Visit {&#10;&#10;    public static void main(String[] args) {&#10;&#10;        // Create a new vis"
  ]
  node [
    id 145
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::setId"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 146
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::setDate"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 147
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::setDescription"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 148
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::setPetId"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 149
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::aVisit"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;package VisitBuilder;&#10;&#10;import java.util.ArrayList;&#10;import java.util.List;&#10;&#10;public class VisitBu"
  ]
  node [
    id 150
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::id"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 151
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::date"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 152
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::description"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;#include <stdio.h>&#10;#include <stdlib.h>&#10;#include <string.h>&#10;#include <math.h>&#10;#include <time.h>&#10;"
  ]
  node [
    id 153
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::petId"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;package visitbuilder;&#10;&#10;import java.util.ArrayList;&#10;import java.util.List;&#10;&#10;public class VisitBu"
  ]
  node [
    id 154
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\model\Visit.java::build"
    type "method"
    intent "UNKNOWN"
    domain "javabean"
    business_role "DOMAIN"
    llm_hint "&#10;*/&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;&#10;"
  ]
  node [
    id 155
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\web\VisitResource.java"
    type "file"
  ]
  node [
    id 156
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\web\VisitResource.java::create"
    type "method"
    intent "CREATE"
    domain "juergen"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;class VisitResource {&#10;  constructor() {&#10;    this.resource = new Resource();&#10;  }&#10;&#10;  get resource"
  ]
  node [
    id 157
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\web\VisitResource.java::read"
    type "method"
    intent "UNKNOWN"
    domain "juergen"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;class VisitResource {&#10;    constructor() {&#10;        this.resource = {};&#10;    }&#10;&#10;    get resource()"
  ]
  node [
    id 158
    label "spring-petclinic-visits-service\src\main\java\org\springframework\samples\petclinic\visits\web\VisitResource.java::Visits"
    type "method"
    intent "UNKNOWN"
    domain "juergen"
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;class VisitResource {&#10;    constructor() {&#10;        this.resource = {};&#10;    }&#10;&#10;    visit(resource"
  ]
  node [
    id 159
    label "spring-petclinic-visits-service\src\test\java\org\springframework\samples\petclinic\visits\web\VisitResourceTest.java"
    type "file"
  ]
  node [
    id 160
    label "spring-petclinic-visits-service\src\test\java\org\springframework\samples\petclinic\visits\web\VisitResourceTest.java::shouldFetchVisits"
    type "method"
    intent "READ"
    domain ""
    business_role "CONTROLLER"
    llm_hint "&#10;*/&#10;&#10;var shouldFetchVisits = function shouldFetchVisits() {&#10;  var visitResource = new VisitResource("
  ]
  node [
    id 161
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java"
    type "file"
  ]
  node [
    id 162
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java::main"
    type "method"
    intent "UNKNOWN"
    domain "petclinic"
    business_role "REPOSITORY"
    llm_hint "/*&#10; * Copyright (c) 2008-2021, Hazelcast, Inc. All Rights Reserved.&#10; *&#10; * Licensed under the Apache "
  ]
  node [
    id 163
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java::parseFile"
    type "method"
    intent "UNKNOWN"
    domain "petclinic"
    business_role "REPOSITORY"
    llm_hint "&#10;What is the file name?&#10;&#10;What is the line number?&#10;&#10;What is the column number?&#10;&#10;What is the line numb"
  ]
  node [
    id 164
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java::exportStaticGraphGML"
    type "method"
    intent "UNKNOWN"
    domain "petclinic"
    business_role "REPOSITORY"
    llm_hint "&#10;Class: RepoWideExtractor&#10;Method: exportStaticGraphGML&#10;Comment: *&#10; * Multi-module PetClinic reposito"
  ]
  node [
    id 165
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java::exportSemanticJSON"
    type "method"
    intent "UNKNOWN"
    domain "petclinic"
    business_role "REPOSITORY"
    llm_hint "&#10;What is the exportSemanticJSON method?&#10;&#10;This method is a helper method that returns a JSON represen"
  ]
  node [
    id 166
    label "src\main\java\org\springframework\samples\petclinic\analysis\RepoWideExtractor.java::exportSemanticGraphML"
    type "method"
    intent "UNKNOWN"
    domain "petclinic"
    business_role "REPOSITORY"
    llm_hint "&#10;Class: RepoWideExtractor&#10;Method: exportSemanticGraphML&#10;Comment: *&#10; * Multi-module PetClinic reposit"
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
    source 20
    target 21
  ]
  edge [
    source 22
    target 23
  ]
  edge [
    source 22
    target 24
  ]
  edge [
    source 22
    target 25
  ]
  edge [
    source 22
    target 26
  ]
  edge [
    source 22
    target 27
  ]
  edge [
    source 28
    target 29
  ]
  edge [
    source 28
    target 30
  ]
  edge [
    source 31
    target 32
  ]
  edge [
    source 31
    target 33
  ]
  edge [
    source 31
    target 34
  ]
  edge [
    source 35
    target 36
  ]
  edge [
    source 37
    target 38
  ]
  edge [
    source 39
    target 40
  ]
  edge [
    source 41
    target 42
  ]
  edge [
    source 41
    target 43
  ]
  edge [
    source 44
    target 45
  ]
  edge [
    source 44
    target 46
  ]
  edge [
    source 44
    target 47
  ]
  edge [
    source 44
    target 48
  ]
  edge [
    source 44
    target 49
  ]
  edge [
    source 44
    target 50
  ]
  edge [
    source 44
    target 51
  ]
  edge [
    source 44
    target 52
  ]
  edge [
    source 44
    target 53
  ]
  edge [
    source 44
    target 54
  ]
  edge [
    source 44
    target 55
  ]
  edge [
    source 44
    target 56
  ]
  edge [
    source 44
    target 57
  ]
  edge [
    source 44
    target 58
  ]
  edge [
    source 44
    target 59
  ]
  edge [
    source 60
    target 61
  ]
  edge [
    source 60
    target 62
  ]
  edge [
    source 60
    target 63
  ]
  edge [
    source 60
    target 64
  ]
  edge [
    source 60
    target 65
  ]
  edge [
    source 60
    target 66
  ]
  edge [
    source 60
    target 67
  ]
  edge [
    source 60
    target 68
  ]
  edge [
    source 60
    target 69
  ]
  edge [
    source 60
    target 70
  ]
  edge [
    source 60
    target 71
  ]
  edge [
    source 60
    target 72
  ]
  edge [
    source 60
    target 73
  ]
  edge [
    source 74
    target 75
  ]
  edge [
    source 74
    target 76
  ]
  edge [
    source 74
    target 77
  ]
  edge [
    source 74
    target 78
  ]
  edge [
    source 79
    target 80
  ]
  edge [
    source 79
    target 81
  ]
  edge [
    source 79
    target 82
  ]
  edge [
    source 79
    target 83
  ]
  edge [
    source 84
    target 85
  ]
  edge [
    source 84
    target 86
  ]
  edge [
    source 84
    target 87
  ]
  edge [
    source 84
    target 88
  ]
  edge [
    source 84
    target 89
  ]
  edge [
    source 84
    target 90
  ]
  edge [
    source 91
    target 92
  ]
  edge [
    source 93
    target 94
  ]
  edge [
    source 93
    target 95
  ]
  edge [
    source 96
    target 97
  ]
  edge [
    source 98
    target 99
  ]
  edge [
    source 100
    target 101
  ]
  edge [
    source 100
    target 102
  ]
  edge [
    source 100
    target 103
  ]
  edge [
    source 104
    target 105
  ]
  edge [
    source 104
    target 106
  ]
  edge [
    source 104
    target 107
  ]
  edge [
    source 104
    target 108
  ]
  edge [
    source 109
    target 110
  ]
  edge [
    source 111
    target 112
  ]
  edge [
    source 111
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
    source 116
    target 118
  ]
  edge [
    source 116
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
    source 131
    target 132
  ]
  edge [
    source 133
    target 134
  ]
  edge [
    source 135
    target 136
  ]
  edge [
    source 137
    target 138
  ]
  edge [
    source 137
    target 139
  ]
  edge [
    source 140
    target 141
  ]
  edge [
    source 140
    target 142
  ]
  edge [
    source 140
    target 143
  ]
  edge [
    source 140
    target 144
  ]
  edge [
    source 140
    target 145
  ]
  edge [
    source 140
    target 146
  ]
  edge [
    source 140
    target 147
  ]
  edge [
    source 140
    target 148
  ]
  edge [
    source 140
    target 149
  ]
  edge [
    source 140
    target 150
  ]
  edge [
    source 140
    target 151
  ]
  edge [
    source 140
    target 152
  ]
  edge [
    source 140
    target 153
  ]
  edge [
    source 140
    target 154
  ]
  edge [
    source 155
    target 156
  ]
  edge [
    source 155
    target 157
  ]
  edge [
    source 155
    target 158
  ]
  edge [
    source 159
    target 160
  ]
  edge [
    source 161
    target 162
  ]
  edge [
    source 161
    target 163
  ]
  edge [
    source 161
    target 164
  ]
  edge [
    source 161
    target 165
  ]
  edge [
    source 161
    target 166
  ]
]
