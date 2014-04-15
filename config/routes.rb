Ecomme::Application.routes.draw do
  resources :line_items

  resources :carts

  root "store#index"
  get 'store/index'


  devise_for :users, :controllers => {:registrations => "registrations"}, 
  :path => '', :path_names => {
    :sign_in => 'login', 
    :sign_out => 'logout', 
    :sign_up => 'join', 
    :edit => 'account/settings'
  }
resources :users
resources :products


end