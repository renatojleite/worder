Rails.application.routes.draw do
  namespace :manager do
    get 'team_leaders/index'
    get 'team_leaders/new'
    get 'team_leaders/create'
    get 'team_leaders/show'
    get 'team_leaders/edit'
    get 'team_leaders/update'
    get 'team_leaders/delete'
  end
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

