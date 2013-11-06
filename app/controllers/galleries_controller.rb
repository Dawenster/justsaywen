class GalleriesController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    puts "*" * 100
    puts params[:controller]
  end
end