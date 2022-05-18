Rails.application.routes.draw do
  root "events#index"

  devise_for :users

  resources :subscriptions
  resources :comments

  resources :users, only: %i[show edit update]

  resources :events do
    resources :comments, only: %i[create destroy]
    resources :subscriptions, only: %i[create destroy]
    resources :photos, only: %i[create destroy]

    post :show, on: :member
  end
end
