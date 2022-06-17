Rails.application.routes.draw do
  root 'projects#index'

  resources :estimates
  resources :projects
  resources :experts
  resources :metrics
end
