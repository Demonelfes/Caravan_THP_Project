Rails.application.routes.draw do
  resources :historic
  resources :orders
  resources :vans
  resources :users

  namespace :admins do
    resources :admins
    resources :historic
    resources :orders
    resources :users
    resources :vans
    resources :vans do
      member do
        post 'hide_van'
      end
    end
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "vans#index"
end
