Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  get 'welcome/about'
  
  resources :sheets do
    resources :teams, except: [:index]
  end
  
  root 'welcome#index'
  
end
