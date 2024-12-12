Feature: User List API

  Background:
    * url 'https://reqres.in/api/users'

  Scenario: Retrieve a list of users
    When method get
    Then status 200
    And match response.data.size() > 0
    And match response.page == 1

  Scenario: Retrieve a paginated list of users (page 2)
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200
    And match response.page == 2
    And match response.data.size() > 0
    And match response.total > 0

  Scenario: Retrieve an empty list of users (page 3)
    Given url 'https://reqres.in/api/users?page=3'
    When method get
    Then status 200
    And match response.data.size() == 0
