Rails.application.routes.draw do
  root 'welcome#index'
  resources :comments, only: [:create, :update, :destroy]
  resources :posts, only: [:create, :index, :show, :update, :destroy]
  resources :contacts, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
