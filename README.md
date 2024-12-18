# Karate Framework API Testing Guide

## Overview

This project demonstrates how to use **Karate** for API testing. Karate is an open-source tool that combines API test automation, performance testing, and mock services in one framework. It’s based on Cucumber, which makes writing tests in Gherkin syntax natural and simple. With Karate, we can easily validate REST APIs, HTTP methods, and much more with minimal configuration.

## Setup

### Prerequisites:
- Java (8 or higher)
- Maven
- IDE (IntelliJ IDEA or VSCode recommended)

### Steps to Set Up:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/jmsdaq/karate-dojo.git
   cd karate-api-testing

2. Install dependencies: Run the following Maven command to install dependencies:
    ```bash
    mvn clean install

3. Run the tests: You can run the tests directly via Maven
    ```bash
   mvn test

Structure
- `src/test/java`: Contains your feature files for test scenarios.
- `karate-config.js`: Holds global variables or configurations used across tests.
- `pom.xml`: Maven build file to manage dependencies. 

## Writing API Tests
### 1. Basic Request and Response Validation
   Here’s a simple example to test a GET API call with ReqRes:
   ```gherkin
   Feature: API Testing with Karate

  Scenario: Validate GET response from ReqRes
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response.data.first_name == 'Janet'
    And match response.data.last_name == 'Weaver'
   ```
### 2. Handling Query Parameters
   ```gherkin
Feature: API Testing with Query Params

  Scenario: Test with query parameters in ReqRes
    Given url 'https://reqres.in/api/users'
    And param page = 2
    When method GET
    Then status 200
    And match response.page == 2
    And match response.data[0].id == 7
   ```
### 3. Testing POST Request
   ```gherkin
Feature: POST request example with ReqRes

  Scenario: Create a new user
    Given url 'https://reqres.in/api/users'
    And header Content-Type = 'application/json'
    And request { name: 'morpheus', job: 'leader' }
    When method POST
    Then status 201
    And match response.name == 'morpheus'
    And match response.job == 'leader'
   ```

### 4. Assertions & Validations
   Karate makes it easy to perform assertions on the response body, headers, and status code:

- `status`: Validate the HTTP status code.
- `match`: Verify specific fields in the response.
- `assert`: Perform more complex assertions like checking response times or JSON schemas.
  
## Customizing Tests
  You can customize your Karate tests by editing `karate-config.js` for global variables or settings. This allows for better reusability and scalability of your tests across different environments or APIs.
  ```
  function fn() {
  var config = {
    baseUrl: 'https://reqres.in/api',
    timeout: 5000
  };
  return config;
}
   ```
    