require "report_builder"
require "date"

Before do #Instanciar os pages antes de executar os testes
  @login_page = LoginPage.new
  @sidebar = SidebarView.new
  @movie_page = MoviePage.new

  page.current_window.resize_to(1440, 900)
end

Before("@login") do #Método para logar com os parametros do arquivo YAML
  user = CONFIG["users"]["cat_manager"]
  @login_page.go
  @login_page.with(user["email"], user["pass"])
end

After do |scenario| #Método para gerar relatório
  #if scenario.failed?
  temp_shot = page.save_screenshot("log/temp_shot.png")
  screenshot = Base64.encode64(File.open(temp_shot, "rb").read)
  embed(screenshot, "image/png", "Screenshot")
  #end
end
