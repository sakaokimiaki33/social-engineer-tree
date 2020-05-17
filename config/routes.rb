Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :homes do
    collection do
        get 'top'
    end
  end
  resources :tweets do 
    resources :comments, only: :create
    collection do 
      get 'search'
    end
  end
  resources :forms, only: :new
  resources :contacts, only: :show
  resources :users, only: :show
end
