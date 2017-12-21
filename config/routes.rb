Rails.application.routes.draw do
  resources :carts
  resources :histories
  resources :carts
  resources :productions do
    resources :users do
    	resources :carts
        end
  end
  resources :authors
  devise_for :users
  resources :users, except: [ :new, :create, :destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to:'users#index'
  root to: 'productions#index'
end
