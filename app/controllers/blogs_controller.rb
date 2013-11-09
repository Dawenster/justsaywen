class BlogsController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    client = Tumblr::Client.new
    @posts = client.posts("dawenster.tumblr.com", :filter => "text")["posts"]
  end

  def show
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    @random_fact = ENV['RANDOM_FACTS'].split("|").sample.strip
    client = Tumblr::Client.new
    @post = client.posts("dawenster.tumblr.com", :id => params[:tumblr_id])["posts"][0]
  end
end