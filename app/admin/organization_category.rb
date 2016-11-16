ActiveAdmin.register OrganizationCategory do
  permit_params :name, :description, :active

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :active, :as => :radio
    end
    f.actions
  end

  #
  # index do
  #   selectable_column
  #   id_column
  #   column :name
  #   column :oblast_id do |organization|
  #     organization.oblast.name
  #   end
  #   column :location
  #   column :address
  #   column :contact_person
  #   column :phone
  #   column :url
  #   column :longitude
  #   column :latitude
  #   column :organization_category_id do |organization|
  #     organization.organization_category.name
  #   end
  #   column :active
  #   actions
  # end


end
