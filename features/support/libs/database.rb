require "pg" #Requer conexão com postgrees

class Database
  def initialize  #Ao iniciar (construtor da classe)
    @connection = PG.connect(CONFIG["database"])  #Conecte com o database com a configuração enviada no env.rb
  end

  def delete_movie(title)
    @connection.exec("DELETE from public.movies where title = '#{title}';") #Execute (Query)
  end

  def insert_movie(movie)
    script = "INSERT INTO public.movies (title, status, year, release_date, created_at, updated_at)" \
    " VALUES ('#{movie["title"]}', '#{movie["status"]}', '#{movie["year"]}', '#{movie["release_date"]}', current_timestamp, current_timestamp);"

    @connection.exec(script) #Execute (Query)
  end
end
