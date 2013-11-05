class BlogsController < ApplicationController
  def index
    client = Tumblr::Client.new
    @posts = client.posts("dawenster.tumblr.com")["posts"]
  end
end