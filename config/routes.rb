Rails.application.routes.draw do
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
      #comments
      #likes
  end
  root to: 'users#index'
end
