#my_app.rb
require 'sinatra'
require './horoscopes.rb'

class MyApp < Sinatra::Base
  get "/" do
    erb :index
  end

  get "/cute_pictures_of_animals" do
    erb :cute_pictures_of_animals
  end

  get "/about_me" do
    erb :about_me
  end

  get "/horoscopes/:sign" do
    erb :signs, :locals => {:sign => params[:sign], :horoscope => Horoscope.return_random_horoscope(params[:sign])}
  end

  get "/faq" do
    erb :faq
  end
end