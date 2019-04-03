*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary
#Test template  Test template - Open Web By URL

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Variables ***


*** Test Cases ***
1 - Open google
  [Template]  Test template - Open Web By URL
  https://www.google.com/  gc

2 - Open Amazon
  [Template]  Test template - Open Web By URL
  https://www.amazon.com  gc

3 - Open Robot Framework
  [Template]  Test template - Open Web By URL
  http://robotframework.org  ff


*** Keywords ***
Test template - Open Web By URL
  [arguments]  ${URL}  ${BROWSER}
  Open Browser  ${URL}  ${BROWSER}
  sleep  3
  close browser