Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  resources :books do
  resource :favorites, only: [:create, :destroy]
  end
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :book_comments, only: [:create, :destroy]
  
  get "search" => "searches#search"
  end