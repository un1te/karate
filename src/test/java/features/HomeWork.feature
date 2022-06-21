Feature: Home Work

  Background: Preconditions
    * url baseUrl
    * def timeValidator = read('classpath:/helpers/TimeValidator.js')

  Scenario: Favorite articles
    * def articleSchema =  read('classpath:/json/ArticlesSchema.json')
    Given path '/articles'
    When method Get
    Then status 200
    * def favoritesCount = $.articles[0].favoritesCount
    * def slugId = $.articles[0].slug

    When path '/articles/' + slugId + '/favorite'
    And method Post
    Then status 200
    And match $.article == articleSchema
    And match $.article.favoritesCount == favoritesCount + 1

    When path '/articles'
    And param favorited = user
    And method Get
    Then status 200
    And match $.articles[0] == articleSchema
    And match $.articles[*].slug contains "#(slugId)"

    When path '/articles/' + slugId + '/favorite'
    And method Delete
    Then status 200


  Scenario: Comment articles
    * def commentsSchema = read('classpath:/json/CommentsSchema.json')
    Given path '/articles'
    When method Get
    Then status 200
    * def slugId = $.articles[0].slug

    Given path '/articles/' + slugId + '/comments'
    When method Get
    Then status 200
    And match $.comments[0] == commentsSchema
    * def commentsCount = response.comments.length

    Given path '/articles/' + slugId + '/comments'
    And request {"comment":{"body":"new comment22"}}
    When method Post
    Then status 200
    And match $.comment == commentsSchema
    * def commentId = $.comment.id

    Given path '/articles/' + slugId + '/comments'
    When method Get
    * def commentsCountAfter = response.comments.length
    Then match commentsCountAfter == commentsCount + 1
    * def commentsCount = commentsCountAfter

    Given path '/articles/' + slugId + '/comments/' + commentId
    When method Delete
    Then status 200
    When  path '/articles/' + slugId + '/comments'
    When method Get
    * def commentsCountAfter = response.comments.length
    Then match commentsCountAfter == commentsCount - 1