require "json"
require "net/http"
require "uri"

class GalleriesController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    @sets = fetch_flickr_sets
  end

  def show
    # FlickRaw.api_key = ENV['FLICKR_KEY']
    # FlickRaw.shared_secret = ENV['FLICKR_SECRET']
    # sets = flickr.photosets.getList(:user_id => "33229628@N04")
    # sets.each_with_index do |set, i|
    #   if set["id"] == params[:flickr_set_id]
    #     @current_set = set
    #     @next_set = sets[i + 1]
    #     @next_set = sets[0] if i == sets.size - 1
    #   end
    # end
    # Bypass legacy redirect internals that are flaky on this upgraded stack.
    response.headers["Location"] = flickr_set_url(params[:flickr_set_id])
    head :found
  end

  private

  def fetch_flickr_sets
    params = {
      "method" => "flickr.photosets.getList",
      "api_key" => ENV["FLICKR_KEY"],
      "user_id" => "33229628@N04",
      "primary_photo_extras" => "url_m,url_z,url_l,url_c,url_o",
      "format" => "json",
      "nojsoncallback" => "1"
    }

    uri = URI("https://api.flickr.com/services/rest/")
    uri.query = URI.encode_www_form(params)
    response = Net::HTTP.get_response(uri)
    return [] unless response.is_a?(Net::HTTPSuccess)

    payload = JSON.parse(response.body)
    return [] unless payload["stat"] == "ok"

    payload.fetch("photosets", {}).fetch("photoset", [])
  rescue StandardError => e
    Rails.logger.error("Flickr photoset fetch failed: #{e.class}: #{e.message}")
    []
  end

  def flickr_set_url(set_id)
    "https://www.flickr.com/photos/33229628@N04/sets/#{set_id}/"
  end
end
