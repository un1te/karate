Feature: Get token
  Scenario: Get token
    * url baseUrl
    Given path '/users/login'
    And request {"user":{"email":#(email),"password":#(password)}}
    When method post
    Then status 200
    * def token = response.user.token