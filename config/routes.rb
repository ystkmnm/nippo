# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resource :welcome, only: %i(show)

  resource :template, only: %i(show update)
  resources :nippos, only: %i(new create show)

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  get '/users/sign_out', controller: 'welcomes', action: 'sign_out'
end
