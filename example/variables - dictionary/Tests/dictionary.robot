*** Settings ***
Library  Collections

*** Variables ***


*** Test Cases ***
Dictionary demo
  ${data_dict} =  create dictionary  key=value  A=1  B=2
  log  ${data_dict["key"]}
  log  ${data_dict["A"]}
  log dictionary  ${data_dict}


*** Keywords ***
