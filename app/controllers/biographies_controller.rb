class BiographiesController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
  end
end