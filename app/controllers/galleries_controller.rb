class GalleriesController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    FlickRaw.api_key = ENV['FLICKR_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SECRET']
    @sets = flickr.photosets.getList(:user_id => "33229628@N04")
  end

  def show
    FlickRaw.api_key = ENV['FLICKR_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_SECRET']
    sets = flickr.photosets.getList(:user_id => "33229628@N04")
    sets.each_with_index do |set, i|
      if set["id"] == params[:flickr_set_id]
        @next_set = sets[i + 1]
        @next_set = sets[0] if i == sets.size - 1
      end
    end
  end
end