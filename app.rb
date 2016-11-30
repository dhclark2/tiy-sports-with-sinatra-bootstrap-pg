require 'sinatra'
require 'pg'

get '/' do
  database = PG.connect(dbname: "tiy-sports")

  # Lets get all the teams from the database
  @rows = database.exec("SELECT name, description, image_url, count(player_id) AS new_column FROM teams, memberships GROUP BY name, description, image_url")

  erb :home
end
