@ignore
Feature:
  Background:
    * url baseUrl
    * def credentials =
    """
    {
    "email": "unite699@gmail.com",
    "password": "pukimann"
    }
    """
    Given path '/users/login'
    And request credentials
    When method post
    Then def token = $.token
    And  header Authorization = token


  Scenario: Create a user

    * def newUser =
    """
    {
    "firstName": "Kos4",
    "lastName": "R",
    "birthdate": "1970-01-01",
    "email": "jdoe@fake.com",
    "phone": "8005555555",
    "street1": "1 Main St.",
    "street2": "Apartment A",
    "city": "Anytown",
    "stateProvince": "KS",
    "postalCode": "12345",
    "country": "USA"
}
    """
    Given path '/contacts'
    And request newUser
    When method post
    Then status 201
    And response.firstName == 'Kos333'
    * def userId = $._id
    * print 'log - userId: ', userId
    * print  responseTime
    * print  responseType
    * print  response

#  Scenario: Check created user's details
#    * print 'log - userId: ', userId
#    Given path '/contacts/' + userId
#    When method get
#    Then status 200
#    And response.firstName == 'Kos54'

#    Given path '/contacts/' + userId
##    * print 'log - userId: ', userId
#    When method delete
#    Then status 200

#  Scenario: Delete user
#    * print 'log - userId: ', userId
#    Given path '/contacts/' + userId
#
#    When method delete
#    Then status 200