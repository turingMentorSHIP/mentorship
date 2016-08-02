Rails.application.routes.draw do

  root "pages#index"
  get "/dashboard", to: "users#show", as: "dashboard"

  resources :users, except: [:new, :show]
  resources :students, only: [:index]
  resources :posses

  get "/lets-go", to: "users#new", as: "lets_go"
  get "/logout", to: "sessions#destroy", as: "logout"
  get "/auth/github", as: "login"
  get "/auth/:provider/callback", to: "sessions#create"

end
