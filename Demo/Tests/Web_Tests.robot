*** Settings ***
Documentation   This file is include all common keywords.
Library         SeleniumLibrary  timeout=90  #run_on_failure=Failure Handler
Library         OperatingSystem
Library         RequestsLibrary
Library         JSONLibrary
Library         String
Library         DateTime
Library         HttpLibrary.HTTP
Resource        ../Resources/Web/Common.robot  #Test Setup  Begin Web Test  ${URL}  ${BROWSER}

*** Variables ***
${BROWSER}      gc
${URL}          http://booking.com

*** Test Cases ***
Open And Close
  [Documentation]  Test avialibility
  open browser  ${URL}  ${BROWSER}
  page should contain  booking
  close browser

Search Room
  [Documentation]  Search room
  [Tags]  booking  google
  open browser  ${URL}  ${BROWSER}
  #Set Selenium Speed  2
  Set Window Size  1280  1024
  # search japan
  input text  //*[@id='ss']  Japan
  wait until page contains element  //*[@id='frm']//span[text()='Popular']
  click element  //*[@id='frm']//span[text()='Popular']
  wait until page contains element  //*[@id="frm"]//div[text()='Check-in - Check-out']
  sleep  2
  # select check-in today
  click element  //*[@id="frm"]//td[@class='bui-calendar__date bui-calendar__date--today']
  sleep  2
  # select check-out
  click element  //*[@id="frm"]//td[@data-date='2019-04-10']
  sleep  2
  # click search button
  click button  //*[@id="frm"]/div[1]/div[4]/div[2]/button
  wait until page contains  properties found
  close browser

Search Room Firefox
  [Documentation]  Search room on firefox
  [Tags]  booking  firefox
  [Timeout]  30 seconds
  open browser  ${URL}  firefox
  #Set Selenium Speed  2
  Set Window Size  1280  1024
  # search japan
  input text  //*[@id='ss']  Japan
  wait until page contains element  //*[@id='frm']//span[text()='Popular']
  click element  //*[@id='frm']//span[text()='Popular']
  wait until page contains element  //*[@id="frm"]//div[text()='Check-in - Check-out']
  sleep  2
  # select check-in today
  click element  //*[@id="frm"]//td[@class='bui-calendar__date bui-calendar__date--today']
  sleep  2
  # select check-out
  click element  //*[@id="frm"]//td[@data-date='2019-04-10']
  sleep  2
  # click search button
  click button  //*[@id="frm"]/div[1]/div[4]/div[2]/button
  wait until page contains  properties found
  close browser
