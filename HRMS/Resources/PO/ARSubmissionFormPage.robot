*** Settings ***
Documentation    Suite description
Resource         ../CommonWeb.robot

*** Variables ***
${Alert_OK_Button} //*[@id="divAlert"]/div/span
${Submit_Button}   //*[@id="btnSubmit"]

*** Keywords ***
Enter Details and submit AR
    [Arguments]  ${Remark}
    Wait Until Page Contains Element    InTime
    sleep  2s
    Click Element   InTime
    Press Key  InTime  BACKSPACE
    Press Key   InTime   1200

    sleep  1s
    Click Element   OutTime
    Press Key  OutTime  BACKSPACE
    Press Key  OutTime   2100

    Wait Until Page Contains Element    Remarks
    Input Text  Remarks   ${Remark}

    Click Button  ${Submit_Button}
    Sleep  3s
    Wait Until Element is Visible   ${Alert_OK_Button}    30s
    Wait Until Keyword Succeeds   3x  0s  Run Keywords
    ...  Click Element    ${Alert_OK_Button}  AND
    ...  Wait Until Element is Not Visible  ${Alert_OK_Button}