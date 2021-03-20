
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  root to:"main#index"
  get "test-page", to:"test#tst", as: :test

  # GET /about
  #get "about", to:"about#index"
  get "about-us", to:"about#index", as: :about

  # Sign up form
  get "sign_up", to:"registrations#new"
  post "sign_up", to:"registrations#create"

  # Sign in form
  get "sign_in", to:"sessions#new"
  post "sign_in", to:"sessions#create"
  
  # Update Password
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  # Reset Password / Forgot Password
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"

  # Password Token  
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  # Logout
  delete "logout", to:"sessions#destroy"
end
