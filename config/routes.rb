Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :tasks
  root 'tasks#index'

  get '/user_login', to: 'sessions#new', as: :user_login

end
