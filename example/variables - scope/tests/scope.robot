*** Settings ***
Documentation   Suite description
Resource        ../resources/scope.robot

*** Variables ***
${MY_VARIABLE} =  info from global

*** Test Cases ***
Create and log variable
  ${my_variable} =  set variable  some info
  log  ${my_variable}

Access a variable
  log  ${my_variable}

*** Keywords ***
