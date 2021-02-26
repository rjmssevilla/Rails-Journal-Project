Rails.application.routes.draw do
  get 'welcome/index'
  devise_for :users, :controllers => {:registrations => "my_devise/registrations"}


resources :users, shallow: true do 
  resources :categories do
    resources :tasks
  end
end

# resources :users do
#   resources :tasks, :only => [:edit, :update, :destroy]
# end

  root to: "welcome#index"
end
