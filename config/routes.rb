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

  resources :users, :path => 'u'

  get "/pages/:page" => "static_pages#show"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: "my_registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
