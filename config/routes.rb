Rails.application.routes.draw do

  get 'about/index'
  get '/change_locale/:locale', to: 'settings#change_locale', as: :change_locale
  root 'organizations#index'

  get 'about/index'


  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    get 'registrations/show/:id' => 'registrations#show', as: 'user_profile'
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  # scope '(/:locale)', locale: /ru/, defaults: { locale: I18n.locale } do
    ActiveAdmin.routes(self)
  # end


  resources :organizations,  only: [:new, :create, :edit, :update, :destroy]


  get 'organizations/show/:id' => 'organizations#show', as: 'organization_show'

  get 'organizations/edit/:id' => 'organizations#edit', as: 'organization_edit'

  get 'organizations/list' => 'organizations#list', as: 'organizations_list'

  get 'organizations/donors' => 'organizations#donors', as: 'donors'

  resources :posts
  resources :post_comments, only: [:create, :edit, :update, :destroy]
  resources :aids

  put 'posts/deactivate/:id' => 'posts#deactivate', as: 'post_deactivate'
  put 'organizations/deactivate/:id' => 'organizations#deactivate', as: 'organization_deactivate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
