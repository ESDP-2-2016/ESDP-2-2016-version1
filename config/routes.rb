Rails.application.routes.draw do

  get 'about/index'

  root 'organizations#index'

  get 'users/show'

  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)



  resources :organizations,  only: [:new, :create, :edit, :update, :destroy]



  get 'users/show/:id' => 'users#show', as: 'user_profile'

  get 'organizations/show/:id' => 'organizations#show', as: 'organization_show'

  get 'organizations/edit/:id' => 'organizations#edit', as: 'organization_edit'

  get 'organizations/list' => 'organizations#list', as: 'organizations_list'

  get 'organizations/donors' => 'organizations#donors', as: 'donors'

  resources :posts
  resources :post_comments, only: [:create, :edit, :update, :destroy]
  resources :aids


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
