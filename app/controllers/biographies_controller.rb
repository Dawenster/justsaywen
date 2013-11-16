class BiographiesController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
  end

  def show
    client = Tumblr::Client.new
    all_posts = client.posts("justsaywen.tumblr.com", :tag => params[:section])["posts"].reverse
    @bio = all_posts[params[:num].to_i - 1]
    @bio["first_image"] = find_first_image(@bio["body"])

    current_index = all_posts.index(@bio)
    if current_index == all_posts.size - 1
      @section = next_bio_section(params[:section])
      @next_bio = client.posts("justsaywen.tumblr.com", :filter => "text", :tag => @section)["posts"].last
      @num = 1
    else
      @section = params[:section]
      @next_bio = all_posts[current_index + 1]
      @num = params[:num].to_i + 1
    end
  end

  def next_bio_section(current_section)
    bio_sections = ["bio", "education", "media", "sports", "music", "other"]
    current_index = bio_sections.index(current_section)
    if current_index == bio_sections.size - 1
      return bio_sections[0]
    else
      return bio_sections[current_index + 1]
    end
  end
end