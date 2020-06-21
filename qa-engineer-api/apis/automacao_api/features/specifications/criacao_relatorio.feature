#language: pt
@relatorio
Funcionalidade: Criação de relatório

Como serviço 
Preciso que seja criado uma funcionalidade para geração de relatório 
Para disponibilizar para nossos clientes um conjunto de dados provenientes de fontes públicas e/ou privadas

Esquema do Cenário: Tentativa de criação do relatório com todos os campos em brancos
    Dado que tenha um token válido
    Quando realizar a criação de um relatório com os seguintes dados:
      | Data_nascimento | <Data_nascimento> |
      | Nome            | <Nome>            |
      | CPF             | <CPF>             |
    Então o relatório não deve ser criado
      E deve ser retornado a seguinte mensagem de erro
          """
          É necessário enviar ao menos um parâmetro para criação do relatório.
          """
    Exemplos:
        | Data_nascimento | Nome | CPF |
        |                 |      |     |

Esquema do Cenário: Tentativa de criação do relatório com alguns campos em brancos
    Dado que tenha um token válido
    Quando realizar a criação de um relatório com os seguintes dados:
      | Data_nascimento | <Data_nascimento> |
      | Nome            | <Nome>            |
      | CPF             | <CPF>             |
    Então o relatório não deve ser criado
    
    Exemplos:
      | Data_nascimento | Nome             | CPF         |
      | 25/05/1988      |                  |             |
      |                 | Gabriel Oliveira |             |
      |                 |                  | 07614917677 |

Esquema do Cenário: Criação do relatório com dados inconsistentes
    Dado que tenha um token válido
    Quando realizar a criação de um relatório com os seguintes dados:
      | Data_nascimento | <Data_nascimento> |
      | Nome            | <Nome>            |
      | CPF             | <CPF>             |
      | Mensagem        | <Mensagem>        |
    Então as fontes de consultas devem retornar que os dados estão inconsistentes
    
    Exemplos:
      | Data_nascimento | Nome             | CPF         | Mensagem                                                                                                               |
      | 28/09/1988      | Gabriel Oliveira | 07614917677 | Data de nascimento informada está divergente da constante na base de dados da Secretaria da Receita Federal do Brasil. |
      | 25/05/1987      | Gabriel Oliveira | 07614917677 | Nome diferente do cadastrado na Receita Federal.                                                                       |

Cenário: Criação do relatório com dados reais
    Dado que tenha um token válido
    Quando realizar a criação do relatório com dados reais
    Então os dados são validados com sucesso nas fontes de consultas

@token_invalido
Esquema do Cenário: Tentativa de criação do relatório com token inválido
    Dado que tenha um token inválido
    Quando realizar a criação de um relatório com os seguintes dados:
      | Data_nascimento | <Data_nascimento> |
      | Nome            | <Nome>            |
      | CPF             | <CPF>             |
    Então o acesso não deve ser permitido

    Exemplos:
      | Data_nascimento | Nome             | CPF         |
      | 28/09/1988      | Gabriel Oliveira | 07614917677 |
