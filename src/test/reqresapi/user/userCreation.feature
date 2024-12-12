Feature: User Creation API

  Background:
    # Set the base URL for the API
    * url 'https://reqres.in/api/users'

  Scenario: Successfully create a new user
    Given request { "name": "James", "job": "Developer" }
    When method post
    Then status 201
    And match response.name == 'James'
    And match response.job == 'Developer'
    And match response.id != null
    And match response.createdAt != null

  Scenario: Create a user with missing data (should return an error)
    Given request { "name": "Jane" }
    When method post
    Then status 400
    And match response.error == 'Missing job'

  Scenario: Create a user with invalid data type (should return an error)
    Given request { "name": 123, "job": true }
    When method post
    Then status 400
    And match response.error == 'Invalid data types'

  Scenario: Validate the response structure after user creation
    Given request { "name": "Alice", "job": "Engineer" }
    When method post
    Then status 201
    And match response == { "name": "#string", "job": "#string", "id": "#number", "createdAt": "#string" }
