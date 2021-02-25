Rails.application.routes.draw do

  devise_for :users
  resources  :users
  resources  :communities do
    resources :follows, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :edit, :update]
  end
  root to: 'communities#index'

  resources :mypage do
    member do
      get 'profile'
    end
  end




end
