Quando("eu faço login com {string} e {string}") do |email, senha|
  @login_page.go
  @login_page.with(email, senha)
end

Então("devo ser autenticado") do
  expect(get_token.length).to be 147 #Esperado que o token seja de 147 caracteres
end

Então("devo ver {string} na área logada") do |expect_name|
  expect(@sidebar.logged_user).to eql expect_name #Esperado que no sidebar contenha o usuário logado com o usuário inserido no arquivo yaml
end

Então("não devo ser autenticado") do
  expect(get_token).to be nil #Esperado que o token seja nulo
end

Então("devo ver a mensagem de alerta {string}") do |expect_message|
  expect(@login_page.alert).to eql expect_message #Esperado ver a mensagem de erro
end
