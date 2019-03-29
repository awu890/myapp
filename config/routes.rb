Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  resources :chatrooms
  resources :chats
  get '/dashboard', to: 'chats#index'
  root 'chatrooms#index'

root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
