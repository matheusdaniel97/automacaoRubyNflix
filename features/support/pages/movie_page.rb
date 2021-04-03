class MoviePage
  include Capybara::DSL

  def initialize
    @movie_list_css = "table tbody tr" #Guarde a string(que representa a tabela em uma variável global)
  end

  def form
    MovieAdd.new  #Instancie a classe que adiciona um novo filme
  end

  def sweet_alert
    SweetAlert.new  #Instancie a classe que trata do sweetAlert
  end

  def add
    find(".movie-add").click
  end

  def movie_tr(title)
    find(@movie_list_css, text: title)  #Encontre na table o título passado pelo step
  end

  def remove(title)
    movie_tr(title).find(".btn-trash").click  #Clique no botão de excluir um filme
  end

  def has_no_movie(title)
    #O load demora um pouco para aparecer, fazendo com que os elementos apareçam antes sem que sejam atualizados dessa forma a implementação utilizada foi da seguinte forma:
    2.times do #Faça ISSO 2x
      @res = page.has_no_css?(@movie_list_css, text: title) #Na página NÃO contém o css (tabela cuja tr contenha o título)
      break if @res == true #Pare de fazer ISSO se resultado for verdadeiro (Se não conter o CSS acima for verdadeiro)
      sleep 1 #Aguarde 1 segundo para fazer ISSO novamente
    end
    @res #Passe o resultado do CSS no método
  end

  def has_movie(title)
    #O load demora um pouco para aparecer, fazendo com que os elementos apareçam antes sem que sejam atualizados dessa forma a implementação utilizada foi da seguinte forma:
    2.times do #Faça ISSO 2x
      @res = page.has_css?(@movie_list_css, text: title) #Na página CONTÉM o css (tabela cuja tr contenha o título)
      #Aqui não contém o Break porque a página deve enviar sempre true como resultado portanto é verificado 2x por confirmação
      sleep 1 #Aguarde 1 segundo para fazer ISSO novamente
    end
    @res #Passe o resultado do CSS no método
  end
end
