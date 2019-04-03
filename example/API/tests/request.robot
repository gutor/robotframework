*** Settings ***
Documentation    Suite description
Library         RequestsLibrary

*** Test Cases ***
Request test
  create session  my_git_hub_session  https://api.w3.org  #https://api.github.com
  ${response} =  get request  my_git_hub_session  doc  #current_user_url
  should be equal as strings  ${response.status_code}  200
  log  ${response.content}

*** Keywords ***
