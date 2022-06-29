# frozen_string_literal: true

Rails.application.routes.draw do
  root "welcome#show"

  namespace :v1 do
    namespace :api do
      resources :users, only: [:create, :index, :show, :update, :destroy]
      resources :books, only: [:create, :index, :show, :update, :destroy]
      resources :transactions, only: [:create, :index, :show]
    end
  end
end
