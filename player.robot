*** Settings ***
Library   Browser    jsextension=${EXECDIR}/resources/module.js

Test Setup       Start Session
Test Teardown    Finish Session


*** Test Cases ***
TC01 - Tocar Música até o fim
    ${songName}    Set Variable    Music with 5 seconds
    

    
    Mock Music
    Go to     https://parodify.vercel.app
    Get Text    css=.logged-user    contains    Fernando Papito

    ${play}    Get play button    ${songName}
    ${pause}    Get pause button    ${songName}

    Click    ${play}
    Wait For Elements State    ${pause}    visible    2
    Wait For Elements State    ${play}    visible    7


TC02 - Pesquisar Musica
    Go to     https://parodify.vercel.app
    Get Text    css=.logged-user    contains    Fernando Papito
    
    Wait For Elements State    css=input[id='search-input']    visible     1
    Fill Text   css=input[id='search-input']    Bughium
    Click    css=button[class='ml-4']

*** Keywords ***
Start Session
    #para abrir o browser na execução
    New Browser    browser=chromium    headless=False
    New Page   about:blank 

Finish Session
    Take Screenshot

Get play button
    [Arguments]    ${songName}

    ${play}    Set Variable   xpath=//div[contains(@class,"song")]//h6[text()="${songName}"]/..//button[contains(@class, "play")] 
    
    RETURN    ${play}

Get pause button
    [Arguments]    ${songName}

    ${pause}    Set Variable   xpath=//div[contains(@class,"song")]//h6[text()="${songName}"]/..//button[contains(@class, "pause")] 
    
    RETURN    ${pause}