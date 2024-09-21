@feature @regressivo
Feature: GET passando todos os headers no cenario

  Background:
    * def auth = call read("classpath:examples/bancoBV/auth/auth_mostrando_dados_sensiveis.feature@token")
    * def headers = read("classpath:examples/bancoBV/support/headers/headers.yaml")

  @bancoBV
  Scenario Outline:<status_code> GET
    Given url bancoBV_auth_get
    And path "/v2/consulta"
    And headers headers.headers.GET
    And headers Authorization = "Bearer" + auth.response.access.token
    And headers accountNumber = <accountNumber>
    And headers proxy = <proxy>
    And headers produto = <produto>
    When method GET
    Then status <status_code>
    And match response contains deep expected

    Examples:
      | Cenario 01 valido                        | status_code |  | accountNumber | proxy | produto |
      | Cenario com sucesso com todos parametros | 200         |  | 123456789     | 123   | 9       |

    Examples:
      | Cenario 02 invalido                      | status_code |  | accountNumber | proxy | produto |
      | Cenario com sucesso com todos parametros | 200         |  | 999999999     | 123   | 9       |

    Examples:
      | Cenario 03 nulo                          | status_code |  | accountNumber | proxy | produto |
      | Cenario com sucesso com todos parametros | 200         |  | null          | 123   | 9       |
