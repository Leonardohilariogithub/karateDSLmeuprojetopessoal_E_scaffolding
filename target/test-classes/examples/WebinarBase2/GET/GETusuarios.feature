Feature: Praticando karate framework com API Serverest

  Background:
    * url url

  Scenario: listar usuarios
    Given  path "/usuarios"
    When method GET
    Then status 200

  Scenario: listar usuarios por nome
    Given  path "/usuarios"
    And param nome = "Fulano da Silva"
    When method GET
    Then status 200

  Scenario: listar usuarios por nome e email
    Given  path "/usuarios"
    And params {nome: "Fulano da Silva", email: "fulano@qa.com"}
    When method GET
    Then status 200

  Scenario: listar usuarios por nome e email validar retorno no response do objeto 0
    Given  path "/usuarios"
    And params {nome: "Fulano da Silva", email: "fulano@qa.com"}
    When method GET
    Then status 200
      #andando no response objeto e parametros
    And match response.usuarios[0].nome == "Fulano da Silva"


    #RESPONSE TIPOS
  Scenario: listar usuarios e verificar se algum tem nome "Fulano da Silva"
    Given  path "/usuarios"
    When method GET
    Then status 200
    Then assert responseStatus == 200 || responseStatus == 204
    * match [200, 201] contains responseStatus
    And assert responseTime < 1000
    And match responseType == 'json'
      #asterisco * vai procurar em todos objetos o parametro nome
    And match response.usuarios[*].nome contains "Fulano da Silva"

    #RESPONSE TIPOS
  Scenario: listar usuarios e verificar se algum tem nome "Fulano da Silva"
    Given  path "/usuarios"
    When method GET
    Then status 200
    And match response.quantidade == "#number"
    And match response.quantidade != "#null"