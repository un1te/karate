Feature: Articles

  Background:
    * url baseUrl
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def articleName = dataGenerator.getArticleName()
    * def articleDescription = __gatling.Description
    * def articleRequestBody =  read('classpath:/json/NewArticleRequest.json')
    * print articleName
    * print articleDescription

  Scenario: Create and delete Article
    Given path  '/articles'
    And request articleRequestBody
    When method Post
#    * def articleId = response.article.slug
#    * karate.pause(5000)
#    And path  '/articles/', articleId
#    When method delete
#    Then status 200






