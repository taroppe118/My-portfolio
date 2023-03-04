Rails.application.routes.draw do
  devise_for :users, :places
  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  resources :users, only: [:index, :show, :create, :edit, :update]
  resources :places, only: [:index, :show, :create, :edit, :update, :destroy]
end