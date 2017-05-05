Rails.application.routes.draw do
  resources :tags
  root 'root#index'
end
