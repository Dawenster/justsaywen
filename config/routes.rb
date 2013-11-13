JustSayWen::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root "pages#index"
  get "blog" => "blogs#index", :as => :blogs
  get "about" => "biographies#index", :as => :biographies
  get "work" => "works#index", :as => :works
  get "photography" => "galleries#index", :as => :galleries
  get "bookshelf" => "books#index", :as => :books
  get "travels" => "travels#index", :as => :travels
  get "creative-writing" => "creative_writings#index", :as => :creative_writings
  
  get "/photography/:gallery/:flickr_set_id" => "galleries#show", :as => :gallery

  get "/:slug/:tumblr_id" => "blogs#show", :as => :blog
  get "/:slug" => "redirects#blog"
end
