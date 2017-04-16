Rails.application.routes.draw do

  devise_for :users
  root 'rooms#index'
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :rooms do
    resources :room_members, only:[:new, :create]
  end
  resources :friends, only:[:create]
  post 'users/search' =>  'users#search', as: :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
