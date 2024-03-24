require "sidekiq/web"
Sidekiq::Web.app_url = "/"

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "about_us", to: "about#index", as: :about

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  resources :tweets

  root to: "main#index"

  mount Sidekiq::Web => "/sidekiq"
  get "job" => "job#index"
  get "job/email" => "job#email"
  get "job/post" => "job#delayed_post"
  get "job/long" => "job#long"
  get "job/crash" => "job#crash"
  get "job/bulk" => "job#bulk"
end
