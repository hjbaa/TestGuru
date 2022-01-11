# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'

  resources :users, only: %i[create show]
  resource :session, only: %i[create destroy]

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
