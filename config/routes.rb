Rails.application.routes.draw do

  devise_for :users
  root 'users#index'
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :rooms
  resources :friends, only:[:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
