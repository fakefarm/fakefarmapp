Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get  'signup' => 'users#new'
  resources :users
  resources :tags

  get 'signup' => 'users#new'
  get 'about'  => 'pages#about'
  root 'pages#root'
end
