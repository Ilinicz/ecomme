Ecomme::Application.routes.draw do
  resources :line_items
  resources :store
  resources :carts
  resources :products
  root "store#index"



  devise_for :users, :controllers => {:registrations => "registrations"}, 
  :path => '', :path_names => {
    :sign_in => 'login', 
    :sign_out => 'logout', 
    :sign_up => 'join', 
    :edit => 'account/settings'
  }
resources :users


end