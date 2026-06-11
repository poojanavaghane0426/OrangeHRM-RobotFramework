*** Settings ***
Resource    ../BusinessLogic/BusinessLogic.robot

*** Keywords ***

Given the OrangeHRM login page is open
    Open Login Page

When the user logs in with valid credentials
    Login With Valid Credentials

When the user logs in with invalid credentials
    Login With Invalid Credentials

Then the user should see the dashboard page
    Verify Login Successful

Then the user should see login failure message
    Verify Login Failure Message

When the user logs out from the application
    Perform Logout

Then the user should be redirected to login page
    Verify Logout Successful

When the user adds a new employee
    Add Employee

Then employee should be added successfully
    Verify Employee Added

When the user searches for an employee
    Search Employee

Then employee records should be displayed
    Verify Employee Found