class BlogsController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    page = params[:page].to_i || 0
    client = Tumblr::Client.new
    new_posts = client.posts("dawenster.tumblr.com", :filter => "text", :tag => "new", :offset => page * 20)
    @posts = new_posts["posts"]
    post_count = @posts.size
    if post_count < 20 && post_count != 0
      old_posts = client.posts("dawenster.tumblr.com", :filter => "text", :tag => "old", :limit => 20 - post_count)["posts"]
      @posts += old_posts
    elsif post_count == 0
      total_posts = new_posts["total_posts"]
      already_shown = total_posts % 20
      old_posts = client.posts("dawenster.tumblr.com", :filter => "text", :tag => "old", :offset => already_shown)["posts"]
      @posts += old_posts
    end
    @hide_last = true if @posts.last["slug"] == "numero-uno"
  end

  def show
    client = Tumblr::Client.new
    @post = client.posts("dawenster.tumblr.com", :id => params[:tumblr_id])["posts"][0]
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