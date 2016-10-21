class OrganizationsController < ApplicationController

  def index   
    # @organization_categories = OrganizationCategory.all.where(active: true).where.not(name: 'Донорская помощь')
    # @donor = OrganizationCategory.find_by(name: 'Донорская помощь')
    # @organizations = Organization.all.where(active: true).where.not(organization_category_id: @donor.id)

    @posts = Post.all.where(post_category_id:1)
    @posts = Post.all.order(created_at: :desc).last(3)
    @organization_categories = OrganizationCategory.all.where(active: true)
    @organizations  =  Organization.all.order(created_at: :desc).last(3)
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      UserMailer.welcome_email(AdminUser.first,@organization.id,@organization.name,current_user).deliver_now
      flash[:success] = 'Ваш запрос о регистрации организации отправлен на рассмотрение администратору!'
      @user_organization = UserOrganization.create!(organization_id: @organization.id,
                                                    user_id: current_user.id, role: 1)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update(organization_params)
      redirect_to organizations_list_path
    else
      render 'edit'
    end
  end

  def deactivate
    @organization = Organization.find(params[:id])
    @organization.update_attribute(:active, false)

    flash[:success] = 'Вы удалили организацию!'
    redirect_to root_path
  end

  def list
    @organization_categories = OrganizationCategory.all.where(active: true).where.not(name: 'Доноры')
    @organizations_all = Organization.all.where(active: true).page(params[:page]).per(3)
    @organizations = Organization.where(active: true).select([:id, :name, :latitude, :longitude, :address])
    @help_requests = Post.where(post_category_id: 1).select([:id, :title, :organization_id]).order('created_at desc')
    respond_to do |format|
      format.html
      format.js {}
      format.json {
        render json: {:organizations => @organizations, :posts => @help_requests }
      }
    end
  end

  def donors
    @donor = OrganizationCategory.find_by(name: 'Доноры')
    @organizations = Organization.all.where(active: true).where(organization_category_id: @donor.id)
  end

  def show
    @organization = Organization.find(params[:id])
    @org_user = @organization.user_organizations.find_by(organization_id: @organization.id,role:1)
    @post = Post.where(organization_id: @organization.id)
    unless @org_user.nil?
      @user = @org_user.user
    end
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :location, :phone, :address, :contact_person,
      :longitude, :latitude, :organization_category_id, :oblast_id, :url, :active)
  end

  def user_organization_params
    params.require(:user_organization).permit(:role, :organization_id, :user_id, :post)
  end

end

