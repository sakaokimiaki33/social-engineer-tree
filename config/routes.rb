Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :homes do
    collection do
        get 'top'
    end
  end
  resources :tweets
  resources :forms, only: :new
  resources :contacts, only: :show
  resources :users, only: :show
end
