#my_app.rb
require 'sinatra/base'
require './horoscopes.rb'
require 'yaml'

class MyApp < Sinatra::Base

  get "/" do
    erb :index, :locals => {:title => "Totally Legit Horoscopes"}
  end

  get "/cute_pictures_of_animals" do
    erb :cute_pictures_of_animals, :locals => {:title => "Cute Pictures of Animals", :show_menu => false }
  end

  get "/about_me" do
    erb :about_me, :locals => {:title => "About Me"}
  end

  get "/horoscopes/:sign" do
    erb :signs, :locals => {:sign => params[:sign], :horoscope => Horoscope.return_random_horoscope(params[:sign]), :title => params[:sign], :compatibility => Horoscope.compatible_signs(params[:sign])}
  end

  get "/faq" do
    erb :faq, :locals => {:title => "FAQ"}
  end
end