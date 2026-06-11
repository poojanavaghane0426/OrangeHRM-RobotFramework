*** Settings ***
Resource    ../support/Support.robot

*** Test Cases ***
Positive Login Scenario
    [Documentation]    Verify that user can login with valid credentials
    Given the OrangeHRM login page is open
    When the user logs in with valid credentials
    Then the user should see the dashboard page

Negative Login Scenario
    [Documentation]    Verify invalid credentials show error message
    Given the OrangeHRM login page is open
    When the user logs in with invalid credentials
    Then the user should see login failure message