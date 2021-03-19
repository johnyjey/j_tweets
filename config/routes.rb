
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  # GET /about
  #get "about", to:"about#index"
  get "about-us", to:"about#index", as: :about
  root to:"main#index"
  get "test-page", to:"test#tst", as: :test

  # Sign up form
  get "sign_up", to:"registrations#new"
  post "sign_up", to:"registrations#create"

  # Sign in form
  get "sign_in", to:"sessions#new"
  post "sign_in", to:"sessions#create"
  
  delete "logout", to:"sessions#destroy"
end
