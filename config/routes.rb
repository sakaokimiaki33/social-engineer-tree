Rails.application.routes.draw do
  root to: 'homes#index'
  resources :tweets
  resources :forms, only: :new
  resources :contacts, only: :show
end
