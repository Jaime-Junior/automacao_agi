#language: pt

Funcionalidade: Pesquisa
    Para que o usuário possa pesquisar artigos
    É necessário que entre com o termo desejado
  
  Contexto: Acessar o blog da Agi
    Dado que acesso o blog do Agi
    
@pesquisa
@pesquisa_simples
Esquema do Cenario: Pesquisa com sucesso
    Quando eu faço pesquisa com o <termo> utilizando a <acao>
    Então devo ver o <resultado> e o <termo> exibidos na tela

    Exemplos:
      | termo  | acao     | resultado                  |
      | ""     | "clicar" | "Resultados da busca por:" |
      | " agi" | "clicar" | "Resultados da busca por:" |
      | " @gi" | "clicar" | "Nenhum resultado"         |
      | ""     | "enter"  | "Resultados da busca por:" |
      | " agi" | "enter"  | "Resultados da busca por:" |
      | " @gi" | "enter"  | "Nenhum resultado"         |

@pesquisa
@pesquisa_copia_e_cola
Esquema do Cenario: Pesquisa com copia e cola
    Quando eu copio o termo da pesquisa e depois colo na barra o <termo> pesquisado
    Então devo ver o <resultado> e o <termo> exibidos na tela

    Exemplos:
      | termo  | resultado                  |
      | ""     | "Resultados da busca por:" |
      | " agi" | "Resultados da busca por:" |
      | " @gi" | "Nenhum resultado"         |
      | ""     | "Resultados da busca por:" |
      | " agi" | "Resultados da busca por:" |
      | " @gi" | "Nenhum resultado"         |