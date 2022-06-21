Feature: Delete articles
  Scenario: Delete articles
    * url baseUrl
    Given path  '/articles'
    When method Get
    Then status 200
    * def articleId = response.articles[0].slug
    Given path  '/articles', articleId
    When method delete
    Then status 200