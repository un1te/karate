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

  Scenario Outline: Sign up new user error message validation
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUser = dataGenerator.getRandomUser()
    Given path 'users'
    And request {"user": {"email": "<email>","password":"<password>","username":"<user>"}}
    When method Post
    Then status 422
    And match $ == <errorResponse>

    Examples:
      | email            | password | user          | errorResponse                                      |
      | #(randomEmail)   | password | Karate        | {"errors":{"username":["has already been taken"]}} |
      | karate@gmail.com | password | #(randomUser) | {"errors":{"email":["has already been taken"]}}    |
      | #(randomEmail)   |          | #(randomUser) | {"errors":{"password":["can't be blank"]}}         |
