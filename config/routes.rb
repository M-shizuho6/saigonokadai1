Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'

  resources :users, only: [:index, :edit, :update, :show]

  resources :books, only: [:show, :create, :index, :edit, :destroy, :update]
end
