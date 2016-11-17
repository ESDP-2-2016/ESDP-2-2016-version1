ActiveAdmin.register Organization do

  permit_params :name, :location, :phone, :address, :contact_person, :description,
                :longitude, :latitude, :keywords, :organization_category_id, :oblast_id, :url, :active, :slug
  before_filter :only => [:show, :edit, :update, :destroy] do
    @organization = Organization.find_by_slug!(params[:id])
  end

  controller do
    def update
      if update!
        arr = UserOrganization.where(organization_id:@organization.id, role:1)
        if arr.size>=1
          user=arr[0].user
          UserMailer.notification(user,@organization.id,@organization.name).deliver_now
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, :input_html => { :class => "ckeditor" }
      f.input :oblast_id,  :as => :select,      :collection => Oblast.all
      f.input :location
      f.input :address
      f.input :phone
      f.input :url
      f.input :longitude
      f.input :latitude
      f.input :keywords
      f.input :organization_category_id,  :as => :select,  :collection => OrganizationCategory.all
      f.input :active, :as => :radio
    end
    f.actions

  end


  index do
    selectable_column
    id_column
    column :name
    column :oblast_id do |organization|
      organization.oblast.name
    end
    column :location
    column :address
    column :contact_person
    column :phone
    column :url
    column :longitude
    column :latitude
    column :organization_category_id do |organization|
      organization.organization_category.name
    end
    column :active
    actions
  end

end
