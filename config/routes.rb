Rails.application.routes.draw do
  devise_for :users

  # USER
  namespace :user do
    resources :work_orders, only: [:index, :show, :update]
  end

  # ADMIN
  # namespace
  # after_create in user to create manager
  namespace :manager do
    resources :work_orders
    resources :team_leaders
  end
end

