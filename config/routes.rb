Rails.application.routes.draw do
  resources :notebooks do
    resources :pages
  end
  devise_for :users
  get 'home/index'
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
