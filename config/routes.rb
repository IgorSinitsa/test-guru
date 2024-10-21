Rails.application.routes.draw do
  root to: "tests#index"

  get :sign_up, to: "users#new"
  get :edit_user, to: "users#edit"
  get :login, to: "sessions#new"
  get :logout, to: "sessions#destroy"

  resources :users, only: :create
  resources :sessions, only: :create
  resources :tests, shallow: true do
    resources :questions, shallow: true do
      resources :answers
    end
    member do
      post :start
    end
  end
  resources :result, only: %i[show update index] do
    member do
      get :again
      get :info
    end
  end
end
