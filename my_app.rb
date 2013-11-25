#my_app.rb
require 'sinatra'

class MyApp < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/cute_pictures_of_animals" do
    erb :cute_pictures_of_animals
  end
end