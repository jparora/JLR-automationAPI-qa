Feature: Verify the petstore API services

  Background:
  * url 'https://petstore.swagger.io/v2'
  * headers {accept: application/json}

  Scenario Outline: Validate petstore Api to add pet to the store

    Given headers {Content-Type: application/json}
    And def requestBody = read('requestJson/addPetRequest.json')
    And request requestBody
    And path '/pet'
    When method POST
    Then status <Status Code>
    And print response

    Examples:
      |Status Code|
      |200        |

  Scenario Outline: Validate petstore to find the pet by different status

    Given path '/pet/findByStatus'
    And  param status = 'sold'
    When method GET
    Then status <Status Code>
    And match response == read('responseJson/petFindByStatus.json')

  Examples:
  |Status Code|
  |200        |

  Scenario Outline: Validate petstore to find the pet by Id

    Given path '/pet/<petID>'
    When method GET
    Then status <Status Code>
    And match response == read('responseJson/petFindById.json')

    Examples:
      |Status Code|petID|
      |200        |1010 |

