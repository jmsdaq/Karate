Feature: Login API

  Background:
    * url 'https://reqres.in/api/login'

  Scenario: Successfully log in with valid credentials
    Given request { "email": "eve.holt@reqres.in", "password": "cityslicka" }
    When method post
    Then status 200
    And match response.token != null

  Scenario: Attempt to log in with invalid credentials
    Given request { "email": "eve.holt@reqres.in" }
    When method post
    Then status 400
    And match response.error == 'Missing password'

  Scenario: Attempt to log in with incorrect credentials
    Given request { "email": "invalid@reqres.in", "password": "wrong" }
    When method post
    Then status 400
    And match response.error == 'Invalid login'
