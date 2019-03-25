*** Settings ***
Documentation   This file is include all common keywords.
Library         OperatingSystem
Library         RequestsLibrary
Library         JSONLibrary
Library         String
Library         DateTime
Library         HttpLibrary.HTTP

*** Keywords ***
Prepare Request Json
  [Documentation]  Replace JSON template with input value.
  [Arguments]  ${json_template_file}  ${replace_dict}
  ${request_json} =  OperatingSystem.Get File  ${json_template_file}
  : FOR  ${key}  IN  @{replace_dict.keys()}
  \  ${request_json} =  Replace String  ${request_json}  ${key}  ${replace_dict["${key}"]}
  [Return]  ${request_json}

Post Request To Elastic Server
  [Documentation]  Post request from edited template to Elastic server and return response.
  [Arguments]  ${request_json}
  Log  ${request_json}
  Create Session  elastic_server  http://dev.dtaas.int.thomsonreuters.com:9200
  &{header} =  Create Dictionary  Content-Type=application/json
  ${date} =  Get Current Date  result_format=%Y.%m.%d
  ${response} =  Post Request  alias=elastic_server  uri=/dtaas-filebeat-${date}/doc/_search  data=${request_json}  headers=${header}  timeout=60
  Log  ${response.content}
  Should be equal as strings  ${response.status_code}  200
  ${response_json} =  Convert To Json  ${response.content}
  ${response_json} =  Parse Json  ${response_json}
  Log  ${response_json}
  [Return]  ${response_json}

Convert To Json
  [Documentation]  Convert reponse message from to json format that can extract value by json path.
  [Arguments]  ${response_content}
  ${json_format} =  String.Replace String  ${response_content}  \\\"  \"
  ${json_format} =  String.Replace String  ${json_format}  \"\{  \[\{
  ${json_format} =  String.Replace String  ${json_format}  \}\"  \}\]
  ${json_format} =  String.Replace String  ${json_format}  \"\[\{  \[\{
  ${json_format} =  String.Replace String  ${json_format}  \}\]\"  \}\]
  ${json_format} =  to json  ${json_format}  pretty_print
  log  ${json_format}
  [Return]  ${json_format}

Get DTaaS Error Log
  [Documentation]  Get dtaas-subscriber.log by gid from Elastic server.
  OperatingSystem.Remove File  C:\\temp\\dtaas_error.log
  ${template_path} =  set variable  ${CURDIR}/../JSON_Template
  # Prepare Json request by replace with desire value.
  ${replace_dict} =  create dictionary  %environment%=${ELASTIC_SEARCH_ENVIRONMENT}
  ${request_json} =  prepare request json  ${template_path}/query_error_log.json  ${replace_dict}
  # Post request.
  ${response_content} =  Post Request To Elastic Server  ${request_json}
  # Extract result from response message.
  ${dtaas_subscriber_log} =  get value from json  ${response_content}  $..message
  ${length} =  Get Length  ${dtaas_subscriber_log}
  Return From Keyword If  ${length} == 0
  # Generate Kibana link
  ${current_utc_date} =  Get Current Date  UTC
  ${start_time} =  Subtract Time From Date  ${current_utc_date}  60 minutes  result_format=%Y-%m-%dT%H:%M:%S.000Z
  ${end_time} =  add time to date  ${current_utc_date}  1 minutes  result_format=%Y-%m-%dT%H:%M:%S.000Z
  ${kibana_link} =  set variable  http://dev.dtaas.int.thomsonreuters.com:5601/app/kibana#/discover?_g=(refreshInterval:(display:Off,pause:!f,value:0),time:(from:'${start_time}',mode:absolute,to:'${end_time}'))&_a=(columns:!(message,beat.hostname),filters:!(),index:'672d28c0-d5e5-11e8-adb3-7b710b92ffc1',interval:auto,query:(language:lucene,query:'(level:ERROR%20OR%20message:%22OFFLINE%22)%20AND%20(environment:${ELASTIC_SEARCH_ENVIRONMENT}1%20OR%20environment:${ELASTIC_SEARCH_ENVIRONMENT}2)'),sort:!('@timestamp',asc))
  #  log  ${dtaas_log}
  ${format_log} =  evaluate  '\\n'.join(${dtaas_subscriber_log})
  create file  C:\\temp\\dtaas_error.log  ${format_log}${\n}${\n}Check full log at Kibana:${\n}|${\n}|${\n}v${\n}${\n}"${kibana_link}"