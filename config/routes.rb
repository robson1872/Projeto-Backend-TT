Rails.application.routes.draw do
  resources :formularies do
    resources :questions do
      resources :answers
    end
  end
  resources :users do
    resources :visits
  end
  resources :visits

  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"

end
