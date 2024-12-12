Feature: Swag Labs Login Page UI Testing

  Background:
    * url baseUrl

  Scenario: Verify login page elements are present
    Given driver 'https://www.saucedemo.com'
    Then match driver contains 'Swag Labs'
    And assert element('.login_logo') is visible
    And assert element('#user-name') is visible
    And assert element('#password') is visible
    And assert element('#login-button') is visible

  Scenario: Verify successful login
    Given driver 'https://www.saucedemo.com'
    When input('#user-name', 'standard_user')
    And input('#password', 'secret_sauce')
    And click('#login-button')
    Then match driver contains 'PRODUCTS'

  Scenario: Verify login with invalid credentials
    Given driver 'https://www.saucedemo.com'
    When input('#user-name', 'invalid_user')
    And input('#password', 'invalid_pass')
    And click('#login-button')
    Then match driver contains 'Epic sadface'
    And assert element('.error-message-container') is visible

  Scenario: Verify the login button is disabled when fields are empty
    Given driver 'https://www.saucedemo.com'
    When input('#user-name', '')
    And input('#password', '')
    Then assert element('#login-button') is disabled
