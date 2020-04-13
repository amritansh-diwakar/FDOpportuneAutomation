*** Settings ***
Documentation    Suite description
Resource         ../Resources/PO/LoginPage.robot
Resource         ../Resources/PO/HomePage.robot

#robot -reports HRMS/RobotScripts/Login.robot

*** Test Cases ***
Login successful
    [Tags]    critical
    Start Browser
    Navigate To HRMS
    Login into HRMS     FWIN01710    worksmart#17
    Verify HRMS Homepage

Login unsuccessful
    [Tags]    noncritical
    Start Browser
    Navigate To HRMS
    Login into HRMS     FWIN01711    worksmart#17
    Verify HRMS Homepage