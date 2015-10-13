class PagesController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    client = Tumblr::Client.new
    @posts = client.posts("dawenster.tumblr.com", :limit => 5, :filter => "text")["posts"]
    @books = Book.order("id DESC").first(5)
  end
end