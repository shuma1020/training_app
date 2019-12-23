Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  resources :products do
    collection do
      get "draft"
      get "release"
    end
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
    resources :products
  end
  namespace :mypage do
    resources :products do
      get "liked", on: :collection
      patch "unlike", on: :member
      resources :rewards, only: [:new, :create, :edit, :update, :destroy, :show]
    end
  end
end
