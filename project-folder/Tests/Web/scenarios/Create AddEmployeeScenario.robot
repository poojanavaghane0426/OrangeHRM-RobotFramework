*** Settings ***
Resource    ../support/Support.robot


*** Test Cases ***
Add Employee Scenario
    [Documentation]    Verify user can add employee successfully

    Given the OrangeHRM login page is open
    When the user logs in with valid credentials
    And the user navigates to PIM module
    And the user clicks add employee button
    When the user enters employee details
    And the user clicks save button
    Then employee should be added successfully