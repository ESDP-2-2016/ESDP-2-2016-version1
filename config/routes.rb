Rails.application.routes.draw do

  root 'organizations#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :organizations,  only: [:new, :create, :update, :destroy]

  get 'organizations/show/:id' => 'organizations#show', as: 'organization_show'

  get 'organizations/donors' => 'organizations#donors', as: 'donors'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
