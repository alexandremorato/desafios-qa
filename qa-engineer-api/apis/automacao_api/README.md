# Automação de API 

Esse projeto foi desenvolvido para rodar com Ruby, Httparty e Cucumber.

## Pré-requisitos

- Gerenciador de versões Ruby - `v2.6.6`
- Bundler instalado - `gem install bundler`
- `Token de autorização` - Verificar com a equipe que gerencia os acessos

#### Dica
Tutorial para ajudar na instalação do RVM(Gerenciador de versões)
- [RVM](https://rvm.io/rvm/install)

Após concluir a instalação dos pré-requisitos, dentro do diretório do projeto de automação de API, rodar o comando para instalação das dependências.

```
bundle install
```
## Para rodar os testes no ambiente local

- Criar as seguintes variáveis de ambiente em seu computador

```
export TOKEN="Token fornecido pela equipe de acesso"
export NOME="Nome real"
export CPF="CPF real"
export DATA_NASC="Data de nascimento real"
export TOKEN_INVALIDO="Digitar um token inválido" 
```  

- Execução utilizando tags (@relatorio, @token_invalido)
    ```
    Ex.: cucumber -t @token_invalido
    ```
- Foram criados alguns profiles para facilitar a execução dos testes e geração de relatórios, podem ser conferidos no arquivo `cucumber.yml` 
    ```
    Ex.: cucumber -p all
    ```
## Para rodar os testes no ambiente Docker

### Pré-requisitos


- Criar as seguintes variáveis de ambiente em seu computador

```
export TOKEN="Token fornecido pela equipe de acesso"
export NOME="Nome real"
export CPF="CPF real"
export DATA_NASC="Data de nascimento real"
export TOKEN_INVALIDO="Digitar um token inválido" 
``` 
- `Docker` e `Docker-Compose` instalados

#### Dica
Tutorial para ajudar na instalação do Docker e Docker-compose no Ubuntu
- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [Docker-compose](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04-pt)

Para executar todos os testes

```
    docker-compose -f docker-compose_test.yml up --build
```

Para executar um teste especifico

```
    docker-compose -f docker-compose.yml up --build
    docker-compose -f docker-compose.yml run api cucumber -t `@token_invalido`
```