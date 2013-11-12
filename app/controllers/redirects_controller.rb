class RedirectsController < ApplicationController
  def blog
    if Blog.find_by_slug(params[:slug]).present?
      redirect_to blog_path(params[:slug], "old")
    else
      redirect_to root_url
    end
  end
end