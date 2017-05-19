Rails.application.routes.draw do
  get  'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get  'signup' => 'users#new'
  resources :users
  resources :tags

  get 'signup' => 'users#new'
  get 'about'  => 'pages#about'
  root 'pages#root'
end
