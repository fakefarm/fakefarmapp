Rails.application.routes.draw do
  resources :users
  get 'signup' => 'users#new'
  resources :tags
  root 'root#index'
end
