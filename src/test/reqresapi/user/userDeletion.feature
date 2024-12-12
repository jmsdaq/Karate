Feature: User Deletion API

  Background:
    * url 'https://reqres.in/api/users/'

  Scenario: Successfully delete a user
    Given url 'https://reqres.in/api/users/2'
    When method delete
    Then status 204

  Scenario: Attempt to delete a non-existent user (should return an error)
    Given url 'https://reqres.in/api/users/9999'
    When method delete
    Then status 404
    And match response.error == 'User not found'
