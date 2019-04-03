*** Settings ***
Library  Selenium2Library

*** Keywords ***
Verify Search Completed
    Wait Until Page Contains  results for "${SEARCH_TERM}"

Click Product Link
    [Documentation]  Clicks on the first product in the search results list
    click element  //*[@data-image-index="0"]
    #Click Link  css=#result_0