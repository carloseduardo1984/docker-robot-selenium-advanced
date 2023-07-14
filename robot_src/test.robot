*** Settings ***
Library          SeleniumLibrary     
Library          OperatingSystem 
Test Teardown    Close Browser
| Resource |     variables.robot 

# *** Variables ***
# ${URL}  https://www.google.com
# ${txtSearch}  //*[@name="q"]


*** Test Cases ***

0000-Login process
    [tags]  Regression    Test    
    Open APP 
    Check APP 

1000-Click on Order Management tab
    [tags]  Regression
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage  #disable page crash of chrome
    Call Method    ${chrome_options}    add_argument    --no-sandbox  #disable sandbox mode
    Call Method    ${chrome_options}    add_argument    --headless  #run with no web browser
    Create Webdriver    driver_name=Chrome    alias=google    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    Set Window Size    1200    1000  #run on docker can't use Maximize Browser Window
    Go To   https://post-ch-test.next.dev.aeb.com/home/
    Input Text       id:username           ${USER} 
    Click Element    id:kc-login
    Input Text       id:password           ${PSW} 
    Click Element    id:kc-login
    Sleep   10ms

*** Keywords ***
    
Open APP
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage  #disable page crash of chrome
    Call Method    ${chrome_options}    add_argument    --no-sandbox  #disable sandbox mode
    Call Method    ${chrome_options}    add_argument    --headless  #run with no web browser
    Create Webdriver    driver_name=Chrome    alias=google    chrome_options=${chrome_options}    executable_path=/usr/local/bin/chromedriver
    Set Window Size    1200    1000  #run on docker can't use Maximize Browser Window
    Go To    ${URL}
 
Check APP
   Wait Until Element Is Visible  ${txtSearch}  10s
   Input Text  ${txtSearch}  Robotframework
   Press Keys  ${txtSearch}  RETURN
   Capture Page Screenshot  Robotframework.png

#    SeleniumLibrary.Input Text       id:username           ${USER} 
#    SeleniumLibrary.Click Element    id:kc-login
#    SeleniumLibrary.Input Text       id:password           ${PSW} 
#    SeleniumLibrary.Click Element    id:kc-login
#    Sleep         100ms
   




