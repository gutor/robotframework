*** Settings ***
Documentation   This is some basic info about the whole suite
Library         SeleniumLibrary  # Copy/paste the line below into Terminal to execute:  # robot -d results tests/amazon.robot

*** Variables ***

*** Test Cases ***
User must sign in to check out
  [Documentation]  This is some basic info about the test
  [Tags]  Smoke
  Open Browser  http://www.amazon.com  ie
  Sleep  3sec
  Close Browser

*** Keywords ***
