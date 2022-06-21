
Feature: Udemy
  Background:
    * url baseUrl



  Scenario: Get All Tags
    Given path  '/tags'
    When method get
    Then status 200
    And match response.tags contains 'welcome'
#    And match response.tags contains ['welcome', 'world']
#    And match response.tags contains any [ 'bau', 'world']
#    And match response.tags contains only [ 'world']
    And match response.tags !contains 'car'


  Scenario: Get Articles
    Given path '/articles'
    And params { limit: 500, offset: 0}
    When method get
    Then status 200
#    And match response.articles == '#[6]'
#    And match response.articlesCount == 6
    And match response.articles[0].createdAt contains '2022'
    And match response.articles[*].favoritesCount contains 0
    And match response..createdAt contains "2022-06-15T14:31:51.045Z"
    And match each response..favorited == '#boolean'
    And match each response..favoritesCount == '#number'
    And match each response..bio == '##number'