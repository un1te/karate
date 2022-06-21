Feature: Articles

  Background:
    * url baseUrl
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def articleName = dataGenerator.getArticleName()
#    read from json
    * def articleRequestBody =  read('classpath:/json/NewArticleRequest.json')
    * print articleName


  Scenario: Create an Article
    Given path  '/articles'
    And request articleRequestBody
    When method Post
    Then status 200
    * def articleId = response.article.slug
    And path '/articles'
    When method Get
    Then match response.articles[0].title == articleName


  Scenario: Create and delete Article
    Given path  '/articles'
    And request articleRequestBody
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

  Scenario: Delete all Articles
    Given path  '/articles'
    When method Get
    Then status 200
    * def articleId = response.articles[0].slug
    * def articlesNumber = response.articlesCount - 3
    * def del = function(i){ return karate.call('classpath:/helpers/DeleteArticles.feature')}
    * def foo = karate.repeat(articlesNumber, del )
