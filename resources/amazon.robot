*** Settings ***
Documentation   Suite description
Library         SeleniumLibrary

*** Keywords ***
Open Amazon
  [Documentation]  Open amazon page
  Open Browser  http://www.amazon.com  chrome
  Wait Until Page Contains  Your Amazon.com

Search for product
  [Documentation]  search product
  # search for produce
  Input Text  id=twotabsearchtextbox  Ferrari 458
  Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
  Wait Until Page Contains  results for "Ferrari 458"

Select product from search result
  [Documentation]  Select first item
  click element  //*[@data-image-index="0"]
  Wait Until Page Contains  Back to results

Add product to cart
  Click Button  id=add-to-cart-button
  Wait Until Page Contains  Added to Cart

Begin check out
  Click Link  id=hlb-ptc-btn-native
  Page Should Contain Element  //*[@id="authportal-main-section"]/div[2]/div/div/form/div/div/div/h1
