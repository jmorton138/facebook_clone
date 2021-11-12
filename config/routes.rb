Rails.application.routes.draw do

  root "users#index"
  resources :friend_requests do
    member do
      get 'accept'
      get 'reject'
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
