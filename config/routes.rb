Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "posts#index"

  get "/users/alpha", to: "users#alpha", as: "alpha"
  get "/direct_messages/chat", to: "direct_messages#chat", as: "chat"

  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    resources :posts
    resources :direct_messages
    resources :dm_friends
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update] do
    resources :comments
  end
  delete "/posts/:id", to: "posts#destroy"

  resources :comments do
    resources :likes
  end

  resources :likes

  resources :direct_messages

  resources :dm_friends

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  get "/auth/facebook/callback" => "sessions#create_by_facebook"

end
##make a customer route called /users/alpha. custom route should render an index for the users that show the users
##organized by how much currency they have. 
