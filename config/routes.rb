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
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
