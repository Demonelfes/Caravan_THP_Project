Rails.application.routes.draw do
  devise_for :users

  get '/caravan', to: 'static_pages#company'
  get '/l-equipe', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/faq', to: 'static_pages#faq'
  get '/mentions_legales', to: 'static_pages#legal'
  get '/cgu', to: 'static_pages#terms_of_use'
  get '/confidentialite', to: 'static_pages#privacy_policy'

  resources :orders
  resources :users
  resources :rentals, only: [:create]

  resources :vans, except: [:destroy] do
    collection do
      get 'full_index', to: 'vans#full_index'
      get 'filter', to: 'vans#filter_vans'
      get 'dates_filter', to: 'vans#dates_filter'
    end
    member do
      post 'hide_van'
    end
  end

  namespace :admins do
    resources :admins
    resources :orders, only: [:edit, :update]
    resources :users, only: [:edit, :update]
    resources :vans, except: [:destroy, :show]
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
