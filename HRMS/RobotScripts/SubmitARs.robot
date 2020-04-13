*** Settings ***
Documentation    Suite description
Resource         ../Resources/PO/LoginPage.robot
Resource         ../Resources/PO/HomePage.robot
Resource         ../Resources/PO/MyAttendance.Monthly.robot
Library          ../CustomLibrary/Calendar.py

#robot -d reports -v Valid_Username:FWINxxxxx -v Valid_Password:******** HRMS/RobotScripts/SubmitARs.robot

*** Test Cases ***
Login successful
    [Tags]    critical
    Start Browser
    Navigate To HRMS
    Login into HRMS
    Verify HRMS Homepage

Submit All ARs
    Click On Monthly Att. Button
    Verify My Attendance > Monthly Page
    ${Curr_Month}=  Get Current Month
    Submit All ARs for the month  ${Curr_Month}
    ${Prev_Month}=  Get Previous Month
    Submit All ARs for the month  ${Prev_Month}