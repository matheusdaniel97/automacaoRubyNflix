class MovieAdd
    include Capybara::DSL

    def create(movie)
        #Inserindo título do filme
        find("input[name=title]").set movie["title"]
    
        #Selecionando o status
        select_status(movie["status"]) unless movie["status"].empty? #Selecione o status "se não" no movie status estiver vazio (if + not = unless)
    
        #Inserindo ano
        find("input[name=year]").set movie["year"]
    
        #Inserindo data de lançamento
        find("input[name=release_date]").set movie["release_date"]
    
        #Inserindo a lista de atores
        add_cast(movie["cast"])
    
        #Inserindo a sinopse
        find("textarea[name=overview]").set movie["overview"]
    
        #Fazendo upload da capa
        upload(movie["cover"]) unless movie["cover"].empty? #Faça upload "se não" no movie cover estiver vazio (if + not = unless)
    
        find("#create-movie").click
    end

    def alert
        find(".alert").text
    end

    def upload(file) #Método upload da capa
        cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/" + file) #Seleciona o caminho da imagem
    
        cover_file = cover_file.tr("/", "\\") if OS.windows? #Execute o código para alterar o "/" para "\\" se for windows (alguns windows ocorre problema sem isso)
    
        Capybara.ignore_hidden_elements = false #Ignora a ocultação dos elementos no html (O upcover da linha abaixo estava oculto)
        attach_file("upcover", cover_file)      #Anexe no upcover o arquivo do caminho selecionado previamente
        Capybara.ignore_hidden_elements = true  #Ignore os elementos ocultos
    end
    
    def add_cast(cast) #Método para adicionar atores
        actor = find(".input-new-tag")
        cast.each do |a| #Para cada ator da lista
          actor.set a             #Escreva o ator
          actor.send_keys :tab    #E pressione tab
        end
    end
      
    def select_status(status)  #Selecionando o status em um combobox customizado com LIs
        find("input[placeholder=Status]").click
        find(".el-select-dropdown__item", text: status).click #Seleciona da lista o item cujo texto é igual o status(do arquivo YAML)
    end

end