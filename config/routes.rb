Rails.application.routes.draw do
  devise_for :users

  get 'static_pages/company'
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/faq'

  resources :orders
  resources :users
  resources :rentals

  resources :vans do
    member do
      post 'hide_van'
    end
  end

  namespace :admins do
    resources :admins
    resources :orders
    resources :users
    resources :vans
    resources :vans do
      member do
        post 'hide_van'
        delete 'destroy_van'
      end
    end
  end

  root "vans#index"

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
  
end
