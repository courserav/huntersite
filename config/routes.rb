Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "posts#index"

  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    resources :posts
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
    resources :comments
  end
  delete "/posts/:id", to: "posts#destroy"

  resources :comments do
    resources :likes
  end

  resources :likes

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  get "/auth/facebook/callback" => "sessions#create_by_facebook"

end
