Blog::Application.routes.draw do
  resources :articles
  match "search" => "search#search", as: :search, via: [:get, :post]
end