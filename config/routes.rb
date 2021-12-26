Rails.application.routes.draw do
  resources :issues
  resources :users do
    get 'sign_in', on: :collection
    post 'sign_in', to: 'users#login', on: :collection
    delete 'sign_out'
  end

  get 'welcome/index'
  root to: 'welcome#index'
end
