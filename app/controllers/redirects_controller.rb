class RedirectsController < ApplicationController
  def blog
    if Blog.find_by_slug(params[:slug]).present?
      redirect_to blog_path(params[:slug], "old")
    elsif TumblrPost.find_by_slug(params[:slug]).present?
      redirect_to blog_path(params[:slug], TumblrPost.find_by_slug(params[:slug]).tumblr_id)
    else
      redirect_to root_url
    end
  end
end