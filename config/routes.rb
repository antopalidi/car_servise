Rails.application.routes.draw do
  get 'home/index'
  resources :orders
  resources :jobs
  resources :categories
  resources :workers

  root "home#index"
end
