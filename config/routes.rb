Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up...
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :admin do
    resources :agencies, except: [:destroy] do
      member do
        get :projects
        get :leads
        get :subscription
      end

      # Add a nested resource for projects with destroy
      resources :projects, only: [:destroy]
    end
  end

  # Defines the root path route ("/")
  root "pages#index"

  # Devise routes for user authentication
  devise_for :users
end