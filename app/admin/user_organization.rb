ActiveAdmin.register UserOrganization do

  permit_params :role, :user_id, :organization_id, :approved

  index do
    selectable_column
    id_column
    column :role
    column :user_id
    column :organization_id
    column :approved
    column :created_at
    column :updated_at
    actions
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
