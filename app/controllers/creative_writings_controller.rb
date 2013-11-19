class CreativeWritingsController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
  end

  def show
    client = Tumblr::Client.new
    @creative_writing = client.posts("justsaywen.tumblr.com", :tag => params[:slug])["posts"][0]
    @next_creative_writing = client.posts("justsaywen.tumblr.com", :filter => "text", :tag => next_creative_writing(params[:slug]))["posts"].last
  end

  private

  def next_creative_writing(current_creative_writing)
    creative_writings = [
      "sonshine",
      "chat",
      "dream-team",
      "imperfect-cadence",
      "the-blank-walls",
      "red-handed",
      "silhouette",
      "wishing-well",
      "fly-ing-around",
      "lock-step"
    ]
    current_index = creative_writings.index(current_creative_writing)
    if current_index == creative_writings.size - 1
      return creative_writings[0]
    else
      return creative_writings[current_index + 1]
    end
  end
end