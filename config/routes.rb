# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :you do
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
