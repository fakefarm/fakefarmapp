Rails.application.routes.draw do
  resources :imgs
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)

  mount ImgUploader::UploadEndpoint => '/imgs/upload'
  resources :imgs
  root to: 'imgs#index'

  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get  'signup' => 'users#new'
  resources :users
  resources :tags

  get 'signup' => 'users#new'
  get 'about'  => 'pages#about'
  # root 'pages#root'
end
