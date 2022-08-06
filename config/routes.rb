Rails.application.routes.draw do
  get 'home/index'
  get "orders/filter/:filter" => "orders#index", as: :filtered_orders
  resources :orders
  resources :jobs
  resources :categories
  resources :workers

  root "home#index"
end
