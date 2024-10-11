Rails.application.routes.draw do
  root to: "tests#index"
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
    member do
      post :start
    end
  end
  resources :result, only: %i[show update index] do
    member do
      get :again
    end
  end
end
