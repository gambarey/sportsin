Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: %i[show] do
    resources :offers, only: %i[new create show] do
      resources :applications, only: %i[new index edit update]
    end
  end
  resources :offers, only: %i[destroy index]
end
