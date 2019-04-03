*** Settings ***
Documentation    Suite description
Documentation  database demo
Library         DatabaseLibrary
Library         Collections

*** Test Cases ***
Database demo
# Connect to database
  Run Keyword If  '${db_type}'=='MSSQL'  Connect To Database  pymssql  ${DB_NAME_MSSQL}  ${DB_USERNAME_MSSQL}  ${DB_PASSWORD_MSSQL}  # ${DB_HOSTNAME}  ${DB_PORT}
  ELSE IF  '${db_type}'=='ORACLE'  Connect To Database Using Custom Params  cx_Oracle  '${DB_USERNAME_ORCL}/${DB_PASSWORD_ORCL}@${DB_HOSTNAME_ORCL}/${DB_SID_ORCL}'
  @{db_data_list}  Query  select * from table
  log list  ${db_data_list}
  disconnect from database


