class BlogsController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    page = params[:page].to_i || 0
    client = Tumblr::Client.new
    new_posts = client.posts("dawenster.tumblr.com", :filter => "text", :tag => "new", :offset => page * 20)
    @posts = new_posts["posts"]
    new_post_count = @posts.size

    if new_post_count > 0 && new_post_count < 20 # A page with some new and some old
      old_posts = client.posts("dawenster.tumblr.com", :filter => "text", :tag => "old", :limit => 20 - new_post_count)["posts"]
      @posts += old_posts

    elsif new_post_count == 0 # A page purely with old

      total_posts = new_posts["total_posts"]
      old_posts_shown = (page * 20) - total_posts
      old_posts = client.posts("dawenster.tumblr.com", :filter => "text", :tag => "old", :offset => old_posts_shown)["posts"]
      @posts += old_posts

    end
    @hide_last = true if @posts.last["slug"] == "numero-uno"
  end

  def show
    client = Tumblr::Client.new
    @post = client.posts("dawenster.tumblr.com", :tag => params[:slug])["posts"][0]
    @post["first_image"] = find_first_image(@post["body"])
    current_tag = find_tag_number(@post["tags"])
    if current_tag == 1
      @next_post = client.posts("dawenster.tumblr.com", :filter => "text", :tag => "new", :limit => 1)["posts"][0]
    else
      @next_post = client.posts("dawenster.tumblr.com", :filter => "text", :tag => current_tag - 1)["posts"][0]
    end
  end

  private

  def find_tag_number(arr)
    arr.select{ |e| e.to_i > 0 }.first.to_i
  end
end