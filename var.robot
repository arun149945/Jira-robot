No Title 
*** Settings ***
Documentation	This is a basic documentation of robot file.

Library  SeleniumLibrary
Library   OperatingSystem      
 
    

*** Variables ***

${Browser} =                chrome

${Jira_URL} =     https://t-mobile.okta.com/home/tmobileusa_jira_1/0oa19r98k3bsizAFT297/aln19rd9yuMggw5AV297?fromHome=true
${Input_User_Name} =        //input[@id="okta-signin-username"]
${Input_Password} =        //input[@id="okta-signin-password"]
${Submit_Login} =         //input[@id="okta-signin-submit"]

#${Filter_Search} =  project in (BSWMDBS, BSWMDBS2) AND issuetype = Bug AND "Phase Detected" in ("E2E (QAT)", UAT) AND (status = New OR status = Open AND assignee is EMPTY) AND component in ("BSWMDBS:Samson QAT Triage", "BSWMDBS2:Samson QAT Triage")
${Wait} =      //a[text()='Dashboards']
${Click_On_Issue}        //a[text()='Issues']
${Search_Issue}         //div//div//li[@id="issues_new_search_link"]
${Input_Search_Box}        //textarea[@id="advanced-search"]
${Search_Query}        project in (BSWMDBS2, BSWMDBS) AND issuetype = Bug AND status in (Open, New, Fixed, "Ready To Test", Returned) AND "Phase Detected" = "E2E (QAT)" and labels in (SAMSON-QAT-Testing,Samson-QAT-Testing) and component not in ("BSWMDBS2:Samson Scalability") ORDER BY status DESC
${Search_Button}        //div//button[@class="aui-button aui-button-primary search-button"]
${Export_Button}        //span[text()='Export']
${Export_All_CSV}       //a[@id="allCsvFields"]
${Export_files}        //div//button[@id="csv-export-dialog-export-button"]

${User_Id} =     dummy
${Password} =    dummy
   
  
*** Keywords ***	         
Goto_Jira
          
           # Remove Files    path
            Open Browser      ${Jira_URL}        ${Browser} 
            Maximize Browser Window
            
            
             Wait Until Element Is Enabled                  ${Input_User_Name}
	         Click Element                                  ${Input_User_Name} 
	         
	         Input Text       ${Input_User_Name}            ${User_Id}
	         Input Password   ${Input_Password}             ${Password}
	         Click Element    ${Submit_Login} 	         
             
             Wait Until Element Is Enabled    ${Wait}       20s
             
             Click Element    ${Click_On_Issue} 
             Wait Until Element Is Enabled     ${Search_Issue}    20s       
             Click Element    ${Search_Issue} 
             
             Input Text    ${Input_Search_Box}    ${Search_Query}
             Sleep    3s      
             Click Element    ${Search_Button} 
             Sleep    5s 
             Wait Until Element Is Visible      ${Export_Button}     
             Click Element    ${Export_Button} 
             Wait Until Element Is Enabled    ${Export_All_CSV}
             Click Element    ${Export_All_CSV}  
             
             Wait Until Element Is Enabled    ${Export_files}
             Click Element    ${Export_files}                 
             
             Log To Console    file saved!!!!
             