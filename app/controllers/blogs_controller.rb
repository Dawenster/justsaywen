class BlogsController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
    page = params[:page].to_i || 0
    client = Tumblr::Client.new
    response = client.posts("dawenster.tumblr.com", :filter => "text", :offset => page * 20)
    @posts = response["posts"]
    post_count = @posts.size
    if post_count < 20 && post_count != 0
      blogs = Blog.order("posted_at DESC").limit(20 - post_count)
      blogs.each do |blog|
        @posts << { "title" => blog.title, "body" => blog.body, "slug" => blog.slug, "date" => blog.posted_at, "id" => "old" }
      end
    elsif post_count == 0
      blogs = Blog.order("posted_at ASC").reverse
      blogs.each do |blog|
        @posts << { "title" => blog.title, "body" => blog.body, "slug" => blog.slug, "date" => blog.posted_at, "id" => "old" }
      end
      total_posts = response["total_posts"]
      already_shown = total_posts % 20
      @posts = @posts.pop(already_shown - 1)
    end
    @hide_last = true if @posts.last["slug"] == "numero-uno"
  end

  def show
    @random_fact = ENV['RANDOM_FACTS'].split("|").sample.strip
    client = Tumblr::Client.new
    if params[:tumblr_id] == "old"
      blog = Blog.find_by_slug(params[:slug])
      @post = { "title" => blog.title, "body" => blog.body, "first_image" => blog.image, "date" => blog.posted_at }
    else
      @post = client.posts("dawenster.tumblr.com", :id => params[:tumblr_id])["posts"][0]
      @post["first_image"] = find_first_image(@post["body"])
    end
    posts = client.posts("dawenster.tumblr.com", :filter => "text")["posts"]
    @next_post = @post
    until @next_post["slug"] != @post["slug"]
      @next_post = posts.sample
    end
  end
end