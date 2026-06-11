*** Settings ***
Library    SeleniumLibrary
Variables    ../../../Data/urls.py
Variables    ../../../Data/credentials.py
Variables    ../../../Data/xpaths.py

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_FIELD}    10s

Input Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_FIELD}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text     ${PASSWORD_FIELD}     ${password}

Click Login Button
    Click Button    ${LOGIN_BUTTON}

Verify Login Successful
    Wait Until Element Is Visible    ${DASHBOARD_TEXT}     10s
    Element Should Be Visible    ${DASHBOARD_TEXT}

Verify Login Failure Message
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    10s
    Element Should Contain    ${ERROR_MESSAGE}    Invalid credentials

Close Browser Session
    Run Keyword And Ignore Error     Close Browser

Open Profile Dropdown
    Wait Until Element Is Visible     ${PROFILE_DROPDOWN}     10s
    Click Element    ${PROFILE_DROPDOWN}

Click Logout Button
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    10s
    Click Element     ${LOGOUT_BUTTON}

Verify Logout Successful
    Wait Until Element Is Visible     ${LOGIN_PAGE_TEXT}    10s
    Element Should Be Visible    ${LOGIN_PAGE_TEXT}

Navigate To PIM Module
    Wait Until Element Is Visible     ${PIM_MENU}    10s

    Click Element    ${PIM_MENU}

Click Add Employee Button
    Wait Until Element Is Visible    ${ADD_EMPLOYEE_BUTTON}    10s
    Click Element     ${ADD_EMPLOYEE_BUTTON}

Enter Employee Details
    Wait Until Element Is Visible    ${FIRST_NAME_FIELD}    10s
    Input Text    ${FIRST_NAME_FIELD}    ${EMPLOYEE_FIRST_NAME}
    Input Text    ${LAST_NAME_FIELD}        ${EMPLOYEE_LAST_NAME}    


Click Save Button
    Wait Until Element Is Visible     ${SAVE_BUTTON}    10s
    Sleep    2s
    Click Button    ${SAVE_BUTTON}    


Verify Employee Added Successfully
    Wait Until Element Is Visible    ${PERSONAL_DETAILS_TEXT}    10s
    Element Should Be Visible    ${PERSONAL_DETAILS_TEXT}

Enter Employee Name In Search
    Wait Until Element Is Visible    ${EMPLOYEE_NAME_SEARCH}    ${EXPLICIT_WAIT}

    Input Text    ${EMPLOYEE_NAME_SEAR     ${SEARCH_EMPLOYEE_NAME}

Click Search Button
    Wait Until Element Is Visible
    ...    ${SEARCH_BUTTON}
    ...    ${EXPLICIT_WAIT}

    Click Button
    ...    ${SEARCH_BUTTON}

Verify Employee Record Is Displayed
    Wait Until Element Is Visible
    ...    ${EMPLOYEE_RECORD}
    ...    ${EXPLICIT_WAIT}

    Element Should Be Visible
    ...    ${EMPLOYEE_RECORD}
