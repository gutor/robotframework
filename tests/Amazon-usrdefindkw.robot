*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Variables ***


*** Test Cases ***
Logged out user can search for product
  Open Browser  http://www.amazon.com  chrome
  Wait Until Page Contains  Your Amazon.com
  Input Text  id=twotabsearchtextbox  Ferrari 458
  Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
  Wait Until Page Contains  results for "Ferrari 458"
  close browser

Logged out user can view product
  Open Browser  http://www.amazon.com  chrome
  Wait Until Page Contains  Your Amazon.com
  Input Text  id=twotabsearchtextbox  Ferrari 458
  Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
  Wait Until Page Contains  results for "Ferrari 458"
  click element  //*[@data-image-index="0"]
  Wait Until Page Contains  Back to results
  close browser

User must sign in to check out
  [Documentation]  This is some basic info about the test
  [Tags]  Smoke
  Open Browser  http://www.amazon.com  chrome
  Wait Until Page Contains  Your Amazon.com
  Input Text  id=twotabsearchtextbox  Ferrari 458
  Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
  Wait Until Page Contains  results for "Ferrari 458"
  click element  //*[@data-image-index="0"]
  Wait Until Page Contains  Back to results
  Click Button  id=add-to-cart-button
  Wait Until Page Contains  Added to Cart
  Click Link  id=hlb-ptc-btn-native
  Page Should Contain Element  //*[@id="authportal-main-section"]/div[2]/div/div/form/div/div/div/h1
  Close Browser

Logged out user can search for product - readable
  Open Amazon
  Search for product
  close browser

Logged out user can view product - readable
  Open Amazon
  Search for product
  Select product from search result
  close browser

User must sign in to check out - readable
  [Documentation]  This is some basic info about the test
  [Tags]  Smoke
  Open Amazon
  Search for product
  Select product from search result
  Add product to cart
  Begin check out
  Close Browser

*** Keywords ***
Open Amazon
  Open Browser  http://www.amazon.com  chrome
  Wait Until Page Contains  Your Amazon.com

Search for product
  Input Text  id=twotabsearchtextbox  Ferrari 458
  Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
  Wait Until Page Contains  results for "Ferrari 458"

Select product from search result
  click element  //*[@data-image-index="0"]
   Wait Until Page Contains  Back to results

Add product to cart
  Click Button  id=add-to-cart-button
  Wait Until Page Contains  Added to Cart

Begin check out
  Click Link  id=hlb-ptc-btn-native
  Page Should Contain Element  //*[@id="authportal-main-section"]/div[2]/div/div/form/div/div/div/h1