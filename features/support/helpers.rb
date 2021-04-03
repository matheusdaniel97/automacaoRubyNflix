module Helpers
  def get_token #Método pegar token para ver se o usuário está logado
    2.times do # Faça duas vezes
      js_script = 'return window.localStorage.getItem("default_auth_token");' #Script para retornar o que está em default_auth_token
      @token = page.execute_script(js_script) #Executa o script e guarda o token
      break if @token != nil  #Se token for diferente de nulo, não execute a segunda vez
      sleep 1 #Espere 1s
    end
    @token #retorne o token
  end
end
