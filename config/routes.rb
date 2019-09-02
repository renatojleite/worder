Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # USER
  resources :work_orders, only: [:index, :show, :update]

  # ADMIN
  # namespace
  # after_create in user to create manager
  namespace :manager do
    resources :work_orders
    resources :team_leaders
  end
end

