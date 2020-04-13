*** Settings ***
Documentation    Suite description
Library          SeleniumLibrary

*** Variables ***
${DEFAULT_BROWSER}     gc

*** Keywords ***
Start Browser
    [Arguments]  ${browser}=${DEFAULT_BROWSER}
    Open Browser  about:blank  ${browser}
    Maximize Browser Window
#    Set Selenium Timeout  20s
Quit
    Close Browser