class PagesController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    @pages = {
      "blogs" => "Blog",
      "biographies" => "About me",
      "works" => "Work",
      "galleries" => "Photography",
      "books" => "Bookshelf",
      "travels" => "Travels",
      "creative_writings" => "Creative writing"
    }
  end
end