Traq::Application.routes.draw do
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  resources :sessions, :only => [:new, :create, :destroy]
  resources :sites
  resources :users, :only => [:new, :create]

  root to: 'home#index'
end
