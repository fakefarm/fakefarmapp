Rails.application.routes.draw do
  get 'unpopular-videos' => 'unpopular_videos#index'
  root 'root#index'
  get 'wwwoodall' => 'wwwoodall#index'
  resources :tickets, only: [:index, :new, :create]
end
