*** Settings ***
Documentation       Este arquivo implementa abertura e fechamento do navegador

***Variables***
${base_url}     https://www.sicredi.com.br

*** Keywords ***
Open Session
    Open Chrome
    Set Selenium Implicit Wait      5
    Set Window Size        1280        800

Close Session    
    Close Browser

After Test
    Capture Page Screenshot

Simular Poupança Session
    Open Session

Open Chrome
    Open Browser        ${base_url}/html/ferramenta/simulador-investimento-poupanca/       chrome      options=add_experimental_option('excludeSwitches', ['enable-logging'])