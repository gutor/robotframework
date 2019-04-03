*** Settings ***
Library  Selenium2Library

*** Variables ***


*** Test Cases ***
User can search for products
    Begin Web Test  http://www.amazon.com  gc

*** Keywords ***
Begin Web Test
    [Arguments]  ${url}  ${browser}
    Open Browser  ${url}  ${browser}
    Close Browser

