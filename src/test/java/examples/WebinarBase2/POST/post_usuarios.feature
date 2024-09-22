Feature: Praticando karate framework com API Serverest

  Background:
    * url "https://serverest.dev"

    @ignore
  Scenario: cadastrar usuarios com sucesso unico
    * def body =
    """
     {
        "nome": "LEONARDO HILARIO",
        "email": "hilarioleozinho@gmail.com",
        "password": "teste",
        "administrador": "true"
      }
    """

    Given  path "/usuarios"
    And request body
    When method POST
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"


  Scenario: cadastrar usuarios com sucesso
    * def body =
    """
     {
        "nome": "LEONARDO HILARIO",
        "email": "hilarioleozinho@gmail.com",
        "password": "teste",
        "administrador": "true"
      }
    """

    Given  path "/usuarios"
    And request body
    When method POST
    Then status 400
    And match response.message == "Este email já está sendo usado"

  @testUnico
  Scenario: cadastrar usuarios com sucesso com body em arquivo json

    #Randomico com varios caracteres
   * def now = function(){ return java.lang.System.currentTimeMillis() }

    #Numero radomico entre 1 e 10 aleatorio
    #* def now = function(){ return Math.floor(Math.random() * 10) }

    * def body = read("classpath:/examples/WebinarBase2/POST/json/usuario.json")
    * set body.nome = "Gessica"

    * set body.email = "hilarioleo+" + now() + "+@gmail.com"
    * print body.email

    * set body.password = "123456"
    * set body.administrador = "true"

    Given  path "/usuarios"
    And request body
    When method POST
    Then status 201
    And match response.message == "Cadastro realizado com sucesso"