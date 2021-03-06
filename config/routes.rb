Rails.application.routes.draw do
  resources :companies do
    resources :jobs
  end

  resources :categories, except: [:delete]
  resources :comments, only: [:create]
  resources :contacts, only: [:create]
  resources :dashboard, only: [:index]
  resources :jobs, only: [:index]
end
