#my_app.rb
require 'sinatra'

class MyApp < Sinatra::Base
  get "/" do
    erb :index
  end
end