Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
    get 'signin' => 'devise/sessions#new'
    delete 'signout' => 'devise/sessions#destroy'
    get 'signup' => 'devise/registrations#new'
  end
    #get 'users/:username', to: 'users#show', as: 'user'
  #The Above route is same as below:
  resources :users, only: :show, param: :username do
    member do
      post 'follow', to: 'users#create'
      delete 'unfollow', to: 'users#destroy'
    end
  end

  resources :items do
    member do
      post 'vote', to: 'votes#create'
      delete 'unvote', to: 'votes#destroy'
    end
  end
  resources :tweets

  root 'pages#home'
  get '/' => 'pages#home'
  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'
  get 'tweets' => 'tweets#show'
  get 'admin' => 'admin'
  get 'allusers' => 'users#all', as: 'allusers'
  get 'feed', to: 'feed#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
