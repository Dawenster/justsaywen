class WorksController < ApplicationController
  def index
    @background = eval(ENV['BACKGROUND_IMAGES'])[params[:controller]]
  end

  def show
    client = Tumblr::Client.new
    @work = client.posts("justsaywen.tumblr.com", :tag => params[:slug])["posts"][0]
    @work["first_image"] = find_first_image(@work["body"])
    @next_work = client.posts("justsaywen.tumblr.com", :filter => "text", :tag => next_work(params[:slug]))["posts"].last
  end

  private

  def next_work(current_work)
    works = [
      "time-auction",
      "to-tablets",
      "fly-shortcut",
      "sola-caritas",
      "college-pro-painters",
      "iya",
      "axiom-zen",
      "legal-reach",
      "kpmg",
      "secor",
      "rl-solutions"
    ]
    current_index = works.index(current_work)
    if current_index == works.size - 1
      return works[0]
    else
      return works[current_index + 1]
    end
  end
end