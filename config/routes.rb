Rails.application.routes.draw do
  resources :users
  resources :tags

  get 'signup' => 'users#new'
  get 'about'  => 'pages#about'
  root 'pages#root'
end
