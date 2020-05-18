*** Settings ***
Documentation   Simular Investimento Poupança
...         Sendo um associado
...         Quero informar os valores da simulação
...         Para que eu possa visualizar o formulário de simulação

Resource    ../resources/actions.robot

Suite Setup      Open Session
Suite Teardown   Close Session

Test Teardown   After Test

*** Test Cases ***
Simular Investimento Poupança Pessoa Fisica
    [tags]          simular_sucesso_pf
    Dado que eu acesso a página da Sicredi
    Eu como associado quando preencho os campos para simulação      poupancapf.json
    Então Devo visualizar o formulário de simulação "R$ 2.823"
    
Simular Investimento Poupança Pessoa Juridica
    [tags]          simular_sucesso_pj
    Dado que eu acesso a página da Sicredi
    Eu como associado quando preencho os campos para simulação      poupancapj.json
    Então Devo visualizar o formulário de simulação "R$ 2.172"

Tentativa de Simular Investimento Poupança valor aplicar menor R$ 20
    [Template]      Tentativa de Simulacao
    poupancaVAM20.json         Valor mínimo de 20.00

Tentativa de Simular Investimento Poupança poupar todo mês menor R$ 20,00
    [Template]      Tentativa de Simulacao
    poupancaVPM20.json         Valor mínimo de 20.00

Tentativa de Simular Investimento Poupança tempo que deseja poupar menor 1 mês
    [Template]      Tentativa de Simulacao
    poupancatempozero.json         Valor esperado não confere

Tentativa de Simular Investimento Poupança sem informar valor que quer aplicar
    [Template]      Tentativa de Simulacao
    poupancaVAembranco.json         Valor mínimo de 20.00

Tentativa de Simular Investimento Poupança sem informar quanto quer poupar todo mês
    [Template]      Tentativa de Simulacao
    poupancaVPembranco.json         Valor mínimo de 20.00

Tentativa de Simular Investimento Poupança sem informar quanto tempo quer poupar
    [Template]      Tentativa de Simulacao
    poupancatempoembranco.json         Obrigatório

***Keywords***
Tentativa de Simulacao
    [Arguments]     ${file_name}        ${expect_message}

    Dado que eu acesso a página da Sicredi
    Eu como associado quando preencho os campos para simulação      ${file_name}
    Então Devo visualizar mensagem crítica      ${expect_message}