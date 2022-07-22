Rails.application.routes.draw do
  get 'home/index'
  resources :orders
  resources :jobs
  resources :categories
  resources :workers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
