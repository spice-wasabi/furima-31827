Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :new, :create]
    resources :buyers, only: [:create, :new]
  end
  resources :users, only: [:new, :create] 
  
end
