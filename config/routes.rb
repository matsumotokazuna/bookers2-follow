Rails.application.routes.draw do
  root :to => 'home#top'
  get '/home/about' => 'home#about'
  devise_for :users
  get '/users/:id/follows' => 'users#follows', as:'user_registration_follows'
  get '/users/:id/followers' => 'users#followers', as:'user_registration_followers'
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
  end
  resources :books
end