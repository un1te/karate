Feature:
  Background:
    Given url baseUrl

  Scenario: Sign up new user
    * def email = prefix + '@mail.com'
    * def user = prefix + '_karateUser'
    * def userData = {"email":"#(email)", "username":"#(user)"}
    Given path 'users'
    And request {"user":{"email":#(userData.email),"password":#(password),"username":#(userData.username)}}
    When method Post
    * print response
    Then status 200
