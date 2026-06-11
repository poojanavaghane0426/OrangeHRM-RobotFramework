*** Settings ***
Resource    ../support/Support.robot

*** Test Cases ***
Logout Scenario
    [Documentation]    Verify user can logout successfully

    Given the OrangeHRM login page is open
    When the user logs in with valid credentials
    When the user logs out from the application
    Then the user should be redirected to login page