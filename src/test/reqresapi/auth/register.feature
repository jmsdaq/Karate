Feature: Register API

  Background:
    * url 'https://reqres.in/api/register'

  Scenario: Successfully register with valid credentials
    Given request { "email": "eve.holt@reqres.in", "password": "pistol" }
    When method post
    Then status 200
    And match response.token != null

  Scenario: Attempt to register with missing password
    Given request { "email": "eve.holt@reqres.in" }
    When method post
    Then status 400
    And match response.error == 'Missing password'

  Scenario: Attempt to register with invalid email
    Given request { "email": "invalid", "password": "pistol" }
    When method post
    Then status 400
    And match response.error == 'Invalid email address'
