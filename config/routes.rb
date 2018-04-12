# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :saving_goals
    resources :settings

    root to: 'users#index'
  end

  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    resources :users do
      resources :saving_goals, only: %i[index show create update destroy]
      resources :settings, only: %i[show create update destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
