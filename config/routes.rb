Rails.application.routes.draw do

  resources :projects do
    resources :comments
  end
  
  namespace :project do
    resources :comments
  end
  
  devise_for :users

  resources :home 
  
  resources :msgs

  root "home#index"

end
