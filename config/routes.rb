# frozen_string_literal: true

Rails.application.routes.draw do
  get 'signup', to: 'registrations#new'
  post 'signup', to: 'registrations#create'
  resource :session
  resources :passwords, param: :token

  namespace :you do
    root 'albums#index'

    resources :albums do
      resources :songs, except: %i[index show]
    end
  end

  scope module: 'public' do
    resources :albums, only: %i[index show] do
      resources :songs, only: %i[index show]
    end
  end

  root 'public/pages#home'
end
