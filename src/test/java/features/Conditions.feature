
Feature: Conditions

  Background:
    * url baseUrl

  Scenario: Favorite articles
    Given path '/articles'
    When method Get
    Then status 200
    * def favoritesCount = $.articles[0].favoritesCount
    * def article = $.articles[0]
#    * if (favoritesCount == 0) karate.call('classpath:helpers/AddLike.feature', article)
    * def result =  favoritesCount == 0 ? karate.call('classpath:helpers/AddLike.feature', article).favoritesCount : favoritesCount
    Given path '/articles'
    When method Get
    Then status 200
    And match $.articles[0].favoritesCount == result