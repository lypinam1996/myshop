Rails.application.routes.draw do
  resources :products
  resources :authors
  resources :roles
  devise_for :users
  resources :users, except: [ :new, :create, :destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to:'users#index'
  root to: 'products#index'
end
