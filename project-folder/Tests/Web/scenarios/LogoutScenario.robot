*** Settings ***
Resource    ../support/Support.robot


*** Test Cases ***
Logout Scenario
    [Documentation]    Verify user can logout successfully

    Given the OrangeHRM login page is open
    When the user logs in with valid credentials
    And the user opens the profile dropdown
    And the user clicks logout button
    Then the user should be redirected to login page