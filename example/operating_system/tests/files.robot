*** Settings ***
Library           OperatingSystem
Library           String

*** Test Cases ***
Read Text File
    [Tags]    test text
    ${TextFileContent} =    Get File    D:\\Code\\robotframework\\TestFile.txt
    Log    ${TextFileContent}
    @{lines} =  Split to lines  ${TextFileContent}
    : FOR  ${item}  IN  @{lines}
    \  log  ${item}

Write file
  log  ${EXECDIR}
  Create File  ${EXECDIR}/my_file.txt  สวัสดีวันจันทร์