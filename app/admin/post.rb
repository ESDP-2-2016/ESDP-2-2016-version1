ActiveAdmin.register Post do

  permit_params :title, :body, :keywords, :open, :organization_id, :post_category_id,
                :user_id, :active
  before_filter :only => [:show, :edit, :update, :destroy] do
    @post = Post.find_by_slug!(params[:id])
  end

  # controller do
  #   # defaults :finder => :find_by_slug
  #   # before_action :global, except: [:index]
  #   # private
  #   # def global
  #   #   @post=Post.friendly.find(params[:id])
  #   # end
  # end
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
