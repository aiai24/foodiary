Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'hello/index' => 'hello#index'
  get 'hello/link' => 'hello#link'
  post "reads/createrecipe", to: "reads#create_recipe"
  resources :users, only: [:show] # ユーザーマイページへのルーティング
    resources :posts
    resources :foods
    resources :reads
    root 'hello#index'
end