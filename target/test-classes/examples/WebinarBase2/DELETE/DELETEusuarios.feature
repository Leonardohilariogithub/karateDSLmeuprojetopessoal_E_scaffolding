Feature: deletar usuarios

  Background:
    * url url

  Scenario: deletar usuarios
    * def id = call read("classpath:/examples/WebinarBase2/DELETE/DELETEusuarios.feature@cadastrar")
    * print id
    Given path "/usuarios/"+id.usuarioId
    When method DELETE
    Then status 200
    And match response.message == "Registro excluído com sucesso"


  @ignore
  @cadastrar
  Scenario: Cadastrar para deletar
    * def now = function(){ return java.lang.System.currentTimeMillis() }
    * def email = "hilarioleogessica+" + now() + "+@gmail.com"
    * def body = read("classpath:/examples/WebinarBase2/DELETE/json/usuario.json")
#    * def body =
#    """
#     {
#        "nome": "LEONARDO HILARIO",
#        "email": #(email),
#        "password": "teste",
#        "administrador": "true"
#      }
#    """

    Given  path "/usuarios"
    And request body
    When method POST
    Then status 201
    * def usuarioId = response._id
    * print response._id


