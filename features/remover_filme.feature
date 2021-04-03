#language:pt

@login
Funcionalidade: Remover filme
    Para que eu posssa manter o catálogo atualizado
    Sendo um gestor de catálogo que encontrou um título indesejável
    Posso remover este item

    @rm_confirm
    Cenario: Confirmar exclusão

        Dado que "dbz" está no catálogo
        Quando solicito a exclusão
        E confirmo a solicitação
        Então este item deve ser removido do catálogo

    @rm_cancel
    Cenario: Cancelar exclusão

        Dado que "10_coisas" está no catálogo
        Quando solicito a exclusão
        Mas cancelo a solicitação
        Então este item deve permanecer no catálogo