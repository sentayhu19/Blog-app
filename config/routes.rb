Rails.application.routes.draw do
  
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show] do
      resources :comments, only: %i[new create]
      resources :likes, only: %i[new create]
  end
end
  root to: 'users#index'
end
