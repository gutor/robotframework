*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${BROWSER}      ie

*** Test Cases ***
Open Booking Web Site
  [Documentation]  Test Booking.com
  [Tags]  booking
  Open Browser  https://www.booking.com  ${BROWSER}
  Sleep  2
  Close Browser

Open Booking Web Site FF
  [Documentation]  Test Booking.com
  [Tags]  booking
  Open Browser  https://www.booking.com  ff
  Sleep  2
  Close Browser

Open Booking Web Site IE
  [Documentation]  Test Booking.com
  [Tags]  booking
  Open Browser  https://www.booking.com  ie
  Sleep  2
  Close Browser
