Feature: Conditions

  Background:
    * url baseUrl

  Scenario: Favorite articles
    Given path '/articles/' + slug + '/favorite'
    When method Post
    Then status 200
    * def favoritesCount = $.article.favoritesCount