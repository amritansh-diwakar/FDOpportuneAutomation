*** Settings ***
Documentation    Suite description
Resource         ../CommonWeb.robot


*** Variables ***
${Fulcrum_Image}                css=img[alt='Home']
${MonthlyAttendance_Button}     //*[@id="divPanelQuickLink"]//button[@data-original-title="Monthly Att."]

*** Keywords ***
Verify HRMS Homepage
    Wait Until Page Contains Element    ${Fulcrum_Image}

Click On Monthly Att. Button
    Sleep  1s
    Wait Until Page Contains Element    ${MonthlyAttendance_Button}
    Click Button   ${MonthlyAttendance_Button}