Rails.application.routes.draw do
  root to: "tests#index"
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
