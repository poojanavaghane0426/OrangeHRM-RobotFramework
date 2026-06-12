*** Settings ***
Resource    ../support/Support.robot

*** Test Cases ***
Search Employee Scenario
    [Documentation]    Verify employee can be searched successfully

    Given the OrangeHRM login page is open
    When the user logs in with valid credentials
    When the user searches for an employee
    Then Then employee records should be displayed


