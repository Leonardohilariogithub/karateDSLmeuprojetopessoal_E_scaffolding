
@auth @regressivo
Feature: Autenticação passando dados sensiveis(client id e secret)

  Background:
    * def headers = read("classpath:bv/com/bv/support/data/headers.yaml")
    * def client_id = "l7ggjhgjhgjhghjxxxfgfjhfjhfjhfjjjj"
    * def client_secret = "zzxxl7ggjhgjhgjhghjxxxfgfjhfjhfjhfjjjj"

  @token
  Scenario Outline:<status_code>
    * def body = "client_id=" + client_id + "&client_secret=" + client_secret + "&grant_type=client_credentials"
    Given url bancoBV_auth
    And path "auth/oauth/v2/token_jwt"
    And headers headers.headers.auth
    And request body
    When method POST
    Then status <status_code>
    And match response contains {"acess_token": "#notnull"}

    Examples:
      | status_code |
      | 200         |
