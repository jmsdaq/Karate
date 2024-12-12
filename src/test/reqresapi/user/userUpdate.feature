Feature: User Update API

  Background:
    # Set the base URL for the API
    * url 'https://reqres.in/api/users/2'

  Scenario: Successfully update user data
    Given request { "name": "John Updated", "job": "Senior Developer" }
    When method put
    Then status 200
    And match response.name == 'John Updated'
    And match response.job == 'Senior Developer'
    And match response.updatedAt != null

  Scenario: Update a user with missing data (should return error)
    Given request { "name": "Missing Job" }
    When method put
    Then status 400
    And match response.error == 'Missing job'

  Scenario: Update user with invalid data type (should return error)
    Given request { "name": true, "job": 123 }
    When method put
    Then status 400
    And match response.error == 'Invalid data types'

  Scenario: Validate the response after updating user details
    Given request { "name": "Updated User", "job": "Lead Developer" }
    When method put
    Then status 200
    And match response == { "name": "#string", "job": "#string", "updatedAt": "#string" }
