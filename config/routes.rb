Ecomme::Application.routes.draw do


  ActiveAdmin.routes(self)
  devise_for :users, :controllers => {:registrations => "registrations"}, 
  :path => '', :path_names => {
    :sign_in => 'login', 
    :sign_out => 'logout', 
    :sign_up => 'join', 
    :edit => 'account/settings'
  }

  resources :users

  resources :line_items do
    member do
      post   'change_quantity_of'
      delete 'change_quantity_of'
    end
  end

  resources :orders

  resources :store

  resources :carts

  resources :products do
    get :customers, on: :member
  end

  root "store#index"


end