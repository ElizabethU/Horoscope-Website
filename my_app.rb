#my_app.rb
require 'sinatra/base'
require './horoscopes.rb'
require 'yaml'

class MyApp < Sinatra::Base

  before do 
    @posts = Dir.glob("views/posts/*.erb").map do |post_name|
      post_name.split("/").last.slice(0..-5)
    end
    @sorted_posts = meta_data.sort_by {|post, date_hash| date_hash["date"] }.reverse
  end

  get "/" do
    erb :index, :locals => {:title => "Totally Legit Horoscopes"}
  end

  get "/cute_pictures_of_animals" do
    erb :cute_pictures_of_animals, :locals => {:title => "Cute Pictures of Animals"}
  end

  get "/about_me" do
    erb :about_me, :locals => {:title => "About Me"}
  end

  get "/horoscopes/:sign" do
    erb :signs, :locals => {:sign => params[:sign], :horoscope => Horoscope.return_random_horoscope(params[:sign]), :title => params[:sign]}
  end

  get "/faq" do
    erb :faq, :locals => {:title => "FAQ"}
  end

  get "/blog/:post_name" do
    html = erb("posts/#{params[:post_name]}".to_sym, layout: false,)
    html = html.split("\n\n", 2).last
    erb html, :locals => {:title => "BLOG!"}
    # erb "/posts/#{params[:post_name]}".to_sym, 
  end

  def meta_data
    if @meta_data
      @meta_data
    else
      @meta_data = {}
      @posts.each do |post|
        html = erb("/posts/#{post}".to_sym, layout: false)
        meta = YAML.load(html.split("\n\n", 2).first)
        @meta_data[post] = meta
      end
      @meta_data
    end
  end
end