require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "os"

require_relative "helpers" #Permite que os steps possa utilizar o modulo helpers

World(Helpers)

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["ENV_TYPE"]}.yaml")) #Carrega a configuração do YAML

case ENV["BROWSER"] #No arquivo de configuração no campo BROWSER:
when "firefox"        #se for firefox
  @driver = :selenium #Execute no geckodriver (geckodriver implicito no :selenium)
when "chrome"         #se for chrome
  @driver = :selenium_chrome  #Execute no Chromedriver
when "headless"     #se for headless (Sem ser exibido na tela)
  @driver = :selenium_chrome_headless #Execute com chrome sem abrir o navegador
else
  puts "Invalid Browser"
end

#Configuração do capybara
Capybara.configure do |config|    #Configuração do Capybara
  config.default_driver = @driver   #Executa no driver selecionado no case
  config.app_host = CONFIG["url"]   #Executa na url do arquivo YAML
  config.default_max_wait_time = 10 #Com máximo de tempo de espera para aparecer um elemento de 10s
end
