*** Settings ***
Documentation       Este arquivo implementa funções e elementos da página Simular Investimento - Poupança

Library     SeleniumLibrary

*** Keywords ***
Simular Poupança
    [Arguments]     ${dados_simulacao_json}  #${perfil}        ${valorAplicar}      ${valorInvestir}      ${tempoPoupar}      ${mesAno}    

    Wait Until Element Is Visible   id:valorAplicar      
    Select Radio Button             perfil                          ${dados_simulacao_json['perfil']}       #paraVoce   ou     paraEmpresa
    Input Text                      id:valorAplicar                 ${dados_simulacao_json['valorAplicar']}
    Input Text                      id:valorInvestir                ${dados_simulacao_json['valorInvestir']}
    Input Text                      id:tempo                        ${dados_simulacao_json['tempoPoupar']}
    Selecione Mes ou Ano            ${dados_simulacao_json['mesAno']}           #1 para Meses    ou  2 para Anos
    Capture Page Screenshot
    Click Element                   class:btnAmarelo

Selecione Mes ou Ano
    [Arguments]     ${mesAno}

    Click Element                       class:btSelect
    Wait Until Element Is Visible       class:listaSelect
    Click Element                       xpath:/html/body/div[3]/div/div/div[1]/div/div[1]/form/div[4]/div[2]/div[2]/ul/li[${mesAno}]/a
