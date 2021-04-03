#language:pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catalogo ninjaflix
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com meu email e senha

    @login_happy
    Cenario: Acesso
        Quando eu faço login com "ganzenmuller1997@gmail.com" e "cel15996995309"
        Então devo ser autenticado
        E devo ver "Matheus Daniel" na área logada

    @login_hapless
    Esquema do Cenario: Login sem sucesso
        Quando eu faço login com <email> e <senha>
        Então não devo ser autenticado
        E devo ver a mensagem de alerta <mensagem>

        Exemplos:
        | email                       | senha           | mensagem                      |
        | "ganzenmuller1997@gmail.com"| "abc123"        | "Usuário e/ou senha inválidos"|
        | "emailinvalido@gmail.com"   | "cel15996995309"| "Usuário e/ou senha inválidos"|
        | ""                          | "cel15996995309"| "Opps. Cadê o email?"         |
        | "ganzenmuller1997@gmail.com"| ""              | "Opps. Cadê a senha?"         |