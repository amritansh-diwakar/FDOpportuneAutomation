*** Settings ***
Documentation    Suite description
Resource         ../CommonWeb.robot

*** Variables ***
${HRMS_URL}             https://hrms.opportune.in/FULCRUM-SS/
${Valid_Username}       EmployeeID
${Valid_Password}       password
${UserName_Textbox}     UserName
${Password_Textbox}     Password
${Login_Button}         btnLogin

*** Keywords ***
Navigate To HRMS
    Go To    ${HRMS_URL}

Verify Login Page
    Wait Until Page Contains Element    btnLogin

Login into HRMS
    [Arguments]     ${Username}=${Valid_Username}   ${Password}=${Valid_Password}
    Verify Login Page
    Input Text   UserName    ${Username}
    Input Text   Password    ${Password}
    Click Button  btnLogin
