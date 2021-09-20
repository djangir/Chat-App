Rails.application.routes.draw do
  resources :projects do
    resources :comments
  end
  namespace :project do
    resources :comments
  end
  devise_for :users

  root "projects#index"

  resources :home 

end
