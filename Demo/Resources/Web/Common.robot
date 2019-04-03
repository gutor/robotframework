*** Settings ***
Documentation   web common keyword
Library         SeleniumLibrary  timeout=90  #run_on_failure=Failure Handler
Library         OperatingSystem
Library         RequestsLibrary
Library         JSONLibrary
Library         String
Library         DateTime
Library         HttpLibrary.HTTP

*** Variables ***


*** Keywords ***
Begin Web Test
  [Documentation]  Begin test
  [Arguments]  ${URL}  ${BROWSER}
  open browser  open browser  ${URL}  ${BROWSER}

End Web Test
  close browser


