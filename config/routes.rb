Rails.application.routes.draw do
  resources :issues
  resources :users

  # Defines the root path route ("/")
  # root "articles#index"
  get 'welcome/index'
  root to: 'welcome#index'
end
