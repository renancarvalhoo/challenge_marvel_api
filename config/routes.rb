Rails.application.routes.draw do
  get 'characters/index'
  root 'comics#index'

  resources :upvotes, only: [:create, :destroy]

  resources :comics, only: :index
end
