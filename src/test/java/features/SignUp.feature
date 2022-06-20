Feature:
  Background:
    Given url baseUrl
    * def dataGenerator = Java.type('helpers.DataGenerator')

  Scenario: Sign up new user

    * def email = dataGenerator.getRandomEmail()
    * def user = dataGenerator.getRandomUser()
    * def userData = {"email":"#(email)", "username":"#(user)"}
    Given path 'users'
    And request {"user":{"email":#(userData.email),"password":#(password),"username":#(userData.username)}}
    When method Post
    Then status 200
