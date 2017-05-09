Rails.application.routes.draw do
  resources :users
  resources :tags
  root 'root#index'
end
