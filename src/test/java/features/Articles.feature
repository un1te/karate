Feature: Articles

  Background:
    * url baseUrl
    * def articleName = prefix +"_Hello world2"



  Scenario: Create an Article
    Given path  '/articles'
    And request
    """
    {
      "article":
          {
          "tagList":["hello", "world"],
          "title":"#(articleName)",
          "description":"123",
          "body":"123"
          }
    }
    """
    When method Post
    Then status 200
    * def articleId = response.article.slug
    And path '/articles'
    When method Get
    Then match response.articles[0].title == articleName


  Scenario: Create and delete Article
    Given path  '/articles'
    And request
    """
    {
      "article":
          {
          "tagList":["hello", "world"],
          "title":"#(articleName)",
          "description":"123",
          "body":"123"
          }
    }
    """
    When method Post
    Then status 200
    * def articleId = response.article.slug
    And path '/articles'
    When method Get
    Then match response.articles[0].title == articleName

    And path  '/articles/', articleId
    When method delete
    Then status 200

    And path '/articles'
    When method get
    Then match response.articles[0].title != articleName

