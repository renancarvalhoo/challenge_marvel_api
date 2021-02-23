Rails.application.routes.draw do

  root 'comics#index'

  resource :upvotes, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
