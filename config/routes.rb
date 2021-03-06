Rails.application.routes.draw do
  namespace :mypage do
    get 'top/index'
  end
  get "home/index"
  devise_for :users
  resources :products, only: [:index, :show] do
    collection do
      get "draft"
      get "release"
    end
    resources :patrons, only: [:new, :create]
    patch "like",  on: :member
  end
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    post "login", to: "devise/sessions#create"
    delete "signout", to: "devise/sessions#destroy"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "products#index"

  get "/admin" => "admin/products#index"
  namespace :admin do
    get 'search', to: 'products#search'
    resources :products
  end
  namespace :mypage do
    resources :notifications, only: [:index]
    resources :products do
      get "liked", on: :collection
      patch "unlike", on: :member
      resources :rewards, only: [:new, :create, :edit, :update, :destroy, :show]
    end
    resources :patrons, only: [:index]
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
