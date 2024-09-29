Feature: alteração de dados do usuario

  Background:
    * url url

  Scenario: Alterar um usuario com sucesso

    * def body =
    """
    {
      "nome": "luana assis 2",
      "email": "luana1alteracao@qa.com.br",
      "password": "teste",
      "administrador": "false"
    }

    """

    Given path '/usuarios/0uId1ymfcvPHsRkR'
    And request body
    When method put
    Then status 200
    And match response.message ==  "Registro alterado com sucesso"