# frozen_string_literal: true

Rails.application.routes.draw do
  resources :albums do
    resources :songs, except: %i[index show]
  end
  
  root 'pages#home'
end
