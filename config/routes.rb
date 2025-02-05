Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root to: "tests#index"

  devise_for :users, path: :auth, path_names: { sign_in: :login, sign_out: :logout }
  devise_for :admin, path: :admin, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :gitgists, only: %i[create]
  resources :feedbacks, only: %i[new create edit]
  resources :user_badges, only: :index

  namespace :admin do
    resources :badges
    resources :gists, only: :index
    resources :tests, shallow: true do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers
      end
    end
  end

  resources :result, only: %i[show update index] do
    member do
      get :again
      get :info
    end
  end
end
