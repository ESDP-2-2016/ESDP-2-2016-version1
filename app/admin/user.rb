  ActiveAdmin.register User do
  before_filter :only => [:show, :edit, :update, :destroy] do
    @user = User.find_by_slug!(params[:id])
  end
  permit_params :email, :password, :password_confirmation, :admin, :slug
  # menu :priority => 2, url: ->{ admin_admin_users_path(locale: I18n.locale) } # Pass the locale to the menu link
  #
  # action_item do
  #   link_to I18n.t("New Customer"), new_admin_admin_user_path(locale: I18n.locale) # Pass the locale to the new button
  # end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin, :as => :radio
    end
    f.actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
