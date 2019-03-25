*** Settings ***
Documentation   This file is include all common keywords.
Library         SeleniumLibrary  timeout=90  #run_on_failure=Failure Handler
Library         OperatingSystem
Library         RequestsLibrary
Library         JSONLibrary
Library         String
Library         DateTime
Library         HttpLibrary.HTTP

*** Test Cases ***
Search Room
  open browser  http://booking.com  gc
  #Set Selenium Speed  2
  Set Window Size  1280  1024
  input text  //*[@id='ss']  Japan
  click element  //*[@id="frm"]/div[1]/div[1]/div[1]/div[1]/ul[1]/li[3]
  click element  //*[@data-date='2019-04-12']
  click element  //*[@data-date='2019-04-17']
  click button  //*[@id="frm"]/div[1]/div[4]/div[2]/button
  wait until page contains  Senju Tamuraya
  close browser
