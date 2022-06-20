Feature: Schema

  Background:
    * url baseUrl


  Scenario: Schema Validation
    * def timeValidator = read('classpath:/helpers/TimeValidator.js')
    Given path '/articles'
    When method get
    Then status 200
    And match $ == {"articles": "#[$.articlesCount]", "articlesCount": "#number? _ >= 0"}
    And match $ contains {"articles": "#[$.articlesCount]"}
    And match each $.articles ==
    """
    {
            "slug": "#string",
            "title": "#string",
            "description": "#string",
            "body": "#string",
            "tagList": "#array",
            "createdAt": "#? timeValidator(_)",
            "updatedAt": "#? timeValidator(_)",
            "favorited": '#boolean',
            "favoritesCount": '#number',
            "author": {
                "username": "#string",
                "bio": "##string",
                "image": "#string",
                "following": '#boolean'
            }
    }
    """