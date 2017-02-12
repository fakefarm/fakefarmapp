Rails.application.routes.draw do
  resources :verses
  root 'root#index'
  get 'unpopular-videos' => 'unpopular_videos#index'
  get 'wwwoodall' => 'wwwoodall#index'
  resources :tickets
end
