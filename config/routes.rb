Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: %i[new create]
  end
end
  root to: 'users#index'
  
end
