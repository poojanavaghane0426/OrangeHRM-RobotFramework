*** Settings ***
Library    SeleniumLibrary
Variables    ../../../Data/urls.py
Variables    ../../../Data/credentials.py
Variables    ../../../Data/xpaths.py

*** Keywords ***


Open Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${USERNAME_FIELD}    ${EXPLICIT_WAIT}

Login With Valid Credentials
    Input Text    ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Button  ${LOGIN_BUTTON}

Login With Invalid Credentials
    Input Text    ${USERNAME_FIELD}    ${INVALID_USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${INVALID_PASSWORD}
    Click Button  ${LOGIN_BUTTON}

Verify Login Successful
    Wait Until Element Is Visible    ${DASHBOARD_TEXT}    ${EXPLICIT_WAIT}

Verify Login Failure Message
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    ${EXPLICIT_WAIT}
    Element Should Contain    ${ERROR_MESSAGE}    ${INVALID_CREDENTIALS_TEXT}



Perform Logout
    Wait Until Element Is Visible    ${PROFILE_DROPDOWN}    ${EXPLICIT_WAIT}
    Click Element    ${PROFILE_DROPDOWN}

    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    ${EXPLICIT_WAIT}
    Click Element    ${LOGOUT_BUTTON}

Verify Logout Successful
    Wait Until Element Is Visible    ${LOGIN_PAGE_TEXT}    ${EXPLICIT_WAIT}




Add Employee
    Wait Until Element Is Visible    ${PIM_MENU}    ${EXPLICIT_WAIT}
    Click Element    ${PIM_MENU}

    Wait Until Element Is Visible    ${ADD_EMPLOYEE_BUTTON}    ${EXPLICIT_WAIT}
    Click Element    ${ADD_EMPLOYEE_BUTTON}

    Wait Until Element Is Visible    ${FIRST_NAME_FIELD}    ${EXPLICIT_WAIT}

    Input Text    ${FIRST_NAME_FIELD}    ${EMPLOYEE_FIRST_NAME}
    Input Text    ${LAST_NAME_FIELD}     ${EMPLOYEE_LAST_NAME}

    Wait Until Element Is Visible    ${SAVE_BUTTON}    ${EXPLICIT_WAIT}
    Wait Until Element Is Not Visible    ${LOADER}    ${EXPLICIT_WAIT}

    Click Button    ${SAVE_BUTTON}

Verify Employee Added
    Wait Until Element Is Visible    ${PERSONAL_DETAILS_TEXT}    ${EXPLICIT_WAIT}




Search Employee
    Wait Until Element Is Visible    ${PIM_MENU}    ${EXPLICIT_WAIT}
    Click Element    ${PIM_MENU}

    Wait Until Element Is Visible    ${EMPLOYEE_NAME_SEARCH}    ${EXPLICIT_WAIT}
        Scroll Element Into View         ${EMPLOYEE_NAME_SEARCH}

    Wait Until Element Is Visible    ${SEARCH_BUTTON}    ${EXPLICIT_WAIT}
    Click Button    ${SEARCH_BUTTON}
    Input Text    ${EMPLOYEE_NAME_SEARCH}    ${SEARCH_EMPLOYEE_NAME}
    Sleep    2s

    
    Wait Until Element Is Visible    ${SEARCH_BUTTON}    ${EXPLICIT_WAIT}
    Click Button    ${SEARCH_BUTTON}

Verify Employee Found
    Wait Until Element Is Visible    ${EMPLOYEE_RECORD}    ${EXPLICIT_WAIT}



Close Browser Session
    Run Keyword And Ignore Error    Close Browser