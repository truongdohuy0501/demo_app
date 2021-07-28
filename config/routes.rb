Blog::Application.routes.draw do
  resources :articles
  match "search" => "search#search", as: :search, via: [:get, :post]

  resources :articles do
    resources :posts
  end

  root 'articles#index'
end