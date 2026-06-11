*** Settings ***
Library    SeleniumLibrary
Resource    ../BusinessLogic/BusinessLogic.robot
Variables    ../../../Data/urls.py
Variables    ../../../Data/credentials.py
Variables    ../../../Data/xpaths.py

*** Keywords ***

Given the OrangeHRM login page is open
    Open Login Page

When the user logs in with valid credentials
    Input Username    ${VALID_USERNAME}
    Input Password    ${VALID_PASSWORD}
    Click Login Button

When the user logs in with invalid credentials
    Input Username    ${INVALID_USERNAME}
    Input Password    ${INVALID_PASSWORD}
    Click Login Button

Then the user should see the dashboard page
    Verify Login Successful

Then the user should see login failure message
    Verify Login Failure Message

And the user opens the profile dropdown
    Open Profile Dropdown

And the user clicks logout button
    Click Logout Button

Then the user should be redirected to login page
    Verify Logout Successful

And the user navigates to PIM module
    Navigate To PIM Module

And the user clicks add employee button
    Click Add Employee Button

When the user enters employee details
    Enter Employee Details

And the user clicks save button
    Click Save Button

Then employee should be added successfully
    Verify Employee Added Successfully
