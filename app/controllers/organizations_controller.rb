class OrganizationsController < ApplicationController

  def index   
    # @organization_categories = OrganizationCategory.all.where(active: true).where.not(name: 'Донорская помощь')
    # @donor = OrganizationCategory.find_by(name: 'Донорская помощь')
    # @organizations = Organization.all.where(active: true).where.not(organization_category_id: @donor.id)


  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
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
      redirect_to @organization
    else
      render 'edit'
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy
    redirect_to root_path
  end

  def organizations_list
    @organization_categories = OrganizationCategory.all.where(active: true)
    @organizations = Organization.all.where(active: true)
  end

  def list
    @organizations = Organization.where(active: true)
    respond_to do |format|
      format.html
      format.js {}
      format.json {
        render json: {:organizations => @organizations}
      }
    end
  end

  def donors
    # @donor = OrganizationCategory.find_by(name: 'Донорская помощь')
    # @organizations = Organization.all.where(active: true).where(organization_category_id: @donor.id)
  end

  def show
    @organization = Organization.find(params[:id])
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :location, :phone, :address, :contact_person,
      :longitude, :latitude, :organization_category_id, :oblast_id, :url, :active)
  end

  def user_organization_params
    params.require(:user_organization).permit(:role, :organization_id, :user_id)
  end
end

