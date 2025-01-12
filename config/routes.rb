Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up...
  get "up" => "rails/health#show", as: :rails_health_check

  # Legal pages
  get 'privacy-policy', to: 'pages#privacy_policy', as: :privacy_policy
  get 'terms-of-use', to: 'pages#terms_of_use', as: :terms_of_use
  get 'do-not-sell', to: 'pages#do_not_sell', as: :do_not_sell
  post 'do-not-sell', to: 'pages#create_do_not_sell'

  namespace :admin do
    resources :agencies, except: [:destroy] do
      member do
        get :projects
        get :leads
        get :subscription
      end

      # Add a nested resource for projects
      resources :projects, only: [:new, :create, :destroy]
    end
  end

  # Defines the root path route ("/")
  root "pages#index"

  # Devise routes for user authentication
  devise_for :users
end