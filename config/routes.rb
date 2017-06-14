Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  mount ImgUploader::UploadEndpoint => '/imgs/upload'

  resources :imgs
  resources :tags
  resources :users

  get    'signup' => 'users#new'
  get    'about'  => 'pages#about'
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'pages#root'
end
