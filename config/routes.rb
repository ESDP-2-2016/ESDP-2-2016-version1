Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  root 'organizations#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :organizations,  only: [:new, :create, :update, :destroy]

  get 'users/show/:id' => 'users#show', as: 'user_profile'

  get 'organizations/show/:id' => 'organizations#show', as: 'organization_show'

  get 'organizations/organizations_list' => 'organizations#organizations_list', as: 'organizations_list'

  get 'organizations/donors' => 'organizations#donors', as: 'donors'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
