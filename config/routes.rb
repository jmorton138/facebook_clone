Rails.application.routes.draw do

  root "posts#index"
  resources :friend_requests do
    member do
      get 'accept'
      get 'reject'
    end
  end

  resources :posts do
    resources :likes, only: [:index, :create, :destroy]
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
