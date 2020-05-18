***Settings***
Documentation   Actions é o arquivo que terá keywords que implementam os steps

Library     SeleniumLibrary
Library     OperatingSystem

Resource    pages/BasePage.robot
Resource    pages/SimularPoupanca.robot
Resource    pages/FormularioSimulacaoPage.robot

*** Keywords ***
### Helprs
Get Simulacao Json
    [Arguments]     ${file_name}

    ${file}=    Get File       resources/fixtures/${file_name}
    ${json}=    Evaluate       json.loads($file)       json

    [Return]    ${json}



### Simular Investimento Poupança

Dado que eu acesso a página da Sicredi
    Go To           ${base_url}/html/ferramenta/simulador-investimento-poupanca/

Eu como associado quando preencho os campos para simulação     #"${perfil}" e "${valorAplicar}" e "${valorInvestir}" e "${tempoPoupar}" e "${mesAno}"
    [Arguments]     ${file_name}
    
    ${dados_simulacao_json}=         Get Simulacao Json        ${file_name}
    Simular Poupança        ${dados_simulacao_json}              #${perfil}    ${valorAplicar}    ${valorInvestir}    ${tempoPoupar}    ${mesAno}

Então Devo visualizar o formulário de simulação "${resultado}"
    Wait Until Element Is Visible       ${VALORSIMULADO}
    Element Text Should Be              ${VALORSIMULADO}        ${resultado} 

Então Devo visualizar mensagem crítica 
    [Arguments]     ${expect_message}

    Wait Until Page Contains        ${expect_message}