*** Settings ***
Documentation    Suite description
Resource         ../CommonWeb.robot
Resource         ARSubmissionFormPage.robot

*** Variables ***
${Month_Picker}         txtMonthYear
${Search_Button}        //*[@id="btnSearch"]
${Absent_Row_AR_icon}   //div[@data-original-title='Absent /L.W.P']/ancestor::tr//span[@id='spnAttRegLink']

*** Keywords ***
Verify My Attendance > Monthly Page
    Wait Until Page Contains Element    ${Month_Picker}

Select Month
    [Arguments]  ${Month}
    ${Month_Icon}=  Set Variable  //span[text()='${Month}']
    Verify My Attendance > Monthly Page
    Sleep  1s
    Mouse Down  ${Month_Picker}
    Mouse Up    ${Month_Picker}
    Sleep  1s
    Wait Until Element is Visible  ${Month_Icon}
    Mouse Down   ${Month_Icon}
    Mouse Up     ${Month_Icon}
    Sleep  1s
    Wait Until Page Contains Element    ${Search_Button}
    Click Button    ${Search_Button}
    Sleep  2s

Click AR Icon For The Day
    [Arguments]   ${day}
    ${Day_AR_Icon}=  Set Variable  //*[@id="tbl-muster"]/tbody/tr/td/a[text()='${day}']/ancestor::tr//span[@id='spnAttRegLink']
    Wait Until Element is Visible  ${Day_AR_Icon}
    Click Element  ${Day_AR_Icon}

Submit All ARs For The Month
    [Arguments]  ${Month}
    Select Month    ${Month}
    FOR   ${i}  IN RANGE  20
        ${AR_icon_exist}  ${Absent_Row_AR_icon_element}=  Run Keyword And Ignore Error  Wait Until Element is Visible  ${Absent_Row_AR_icon}
        Exit For Loop If   "${AR_icon_exist}" == "FAIL"
        Click Element   ${Absent_Row_AR_icon}
        Enter Details and submit AR    Worked from home during Lockdown
    END