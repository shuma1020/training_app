Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :products
  resources :rewards
  get 'draft', to: 'products#draft'

  devise_scope :user do
  get 'login', to: 'devise/sessions#new'
  post 'login', to: 'devise/sessions#create'
  delete 'signout', to: 'devise/sessions#destroy'  
  end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"
end
