*** Settings ***
Library  Selenium2Library

*** Keywords ***
Verify Page Loaded
    Page Should Contain Element  //*[@id="authportal-main-section"]/div[2]/div/div/form/div/div/div/h1
    #Element Text Should Be  ap_signin1a_pagelet_title  Sign In
