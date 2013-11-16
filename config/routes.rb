JustSayWen::Application.routes.draw do
  root "pages#index"

  get "about" => "biographies#index", :as => :biographies
  get "about/:section/:num" => "biographies#show", :as => :biography

  get "work" => "works#index", :as => :works

  get "photography" => "galleries#index", :as => :galleries
  get "/photography/:gallery/:flickr_set_id" => "galleries#show", :as => :gallery

  get "bookshelf" => "books#index", :as => :books
  get "bookshelf/quotes-and-motivations" => "books#quotes_and_motivations", :as => :quotes_and_motivations
  get "bookshelf/:slug" => "books#show", :as => :book
  resources :books, :except => [:index, :show]

  get "travels" => "travels#index", :as => :travels
  
  get "creative-writing" => "creative_writings#index", :as => :creative_writings

  get "blog" => "blogs#index", :as => :blogs
  get "/:slug/:tumblr_id" => "blogs#show", :as => :blog
  get "/:slug" => "redirects#blog"
end
