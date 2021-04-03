Dado("que {string} é um novo filme") do |movie_code|
  file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml")) #file = carregue o arquivo yaml(do caminho(caminho do arquivo))
  @movie = file[movie_code] #Faz com que pegue os exemplos dos cenários e execute apenas 1 exemplo por vez
  Database.new.delete_movie(@movie["title"])
end

Dado("este filme já existe no catálogo") do
  Database.new.insert_movie(@movie) #Crie um filme pelo banco
end

Quando("faço cadastro desse filme") do
  @movie_page.add
  @movie_page.form.create(@movie) #Crie um filme com o arquivo (YAML) @movie
end

Então("devo ver o novo filme na lista") do
  result = @movie_page.movie_tr(@movie["title"])  #Guarde a linha do filme cujo título é o mesmo do arquivo YAML
  expect(result).to have_text @movie["title"]     #Esperado que nessa linha contenha o título do arquivo
  expect(result).to have_text @movie["status"]    #Esperado que nessa linha contenha o status do arquivo
end

Então("devo ver a notificação {string}") do |expect_alert|
  expect(@movie_page.form.alert).to eql expect_alert
end

Dado("que {string} está no catálogo") do |movie_code|
  #Executar os dois passos do  cadastro_filmes.features
  steps %{
    Dado que "#{movie_code}" é um novo filme
    E este filme já existe no catálogo
  }
end

Quando("solicito a exclusão") do
  @movie_page.remove(@movie["title"]) #Selecione para remover o filme
end

Quando("confirmo a solicitação") do
  @movie_page.sweet_alert.confirm #Confirme remoção
end

Então("este item deve ser removido do catálogo") do
  expect(@movie_page.has_no_movie(@movie["title"])).to be true #Na página de filmes, NÃO deve haver o filme do arquivo YAML
end

Quando("cancelo a solicitação") do
  @movie_page.sweet_alert.cancel  #Cancele a remoção
end

Então("este item deve permanecer no catálogo") do
  expect(@movie_page.has_movie(@movie["title"])).to be true #Na página de filmes, deve haver o filme do arquivo YAML
end
