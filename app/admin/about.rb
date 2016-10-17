ActiveAdmin.register About do

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
  permit_params :description

  form do |f|
    f.inputs do
      f.input :title
      f.input :keywords
      f.input :description, :input_html => { :class => "ckeditor" }
    end
    f.actions
  end

end
