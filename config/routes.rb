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
  resources :comments, only: [:create, :destroy]

  resources :users

  devise_for :users,:path => 'u'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
