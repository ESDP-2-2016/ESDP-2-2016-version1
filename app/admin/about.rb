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
  permit_params :title, :description, :meta_title, :meta_description, :meta_keywords

  form do |f|
    f.inputs do
      f.input :title
      f.input :meta_title
      f.input :description, :input_html => { :class => "ckeditor" }
      f.input :meta_description
      f.input :meta_keywords
    end
    f.actions
  end

end
