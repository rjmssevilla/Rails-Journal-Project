Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :tasks
  end
  resources :tasks
end
