Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :products do
    collection  do
      get'draft'
      get'release'
    end
  end
  resources :rewards
  devise_scope :user do
  get 'login', to: 'devise/sessions#new'
  post 'login', to: 'devise/sessions#create'
  delete 'signout', to: 'devise/sessions#destroy'  
  end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"
end
