class OrganizationsController < ApplicationController

  def index   
    @organization_categories = OrganizationCategory.all.where(active: true).where.not(name: 'Донорская помощь')    
    @donor = OrganizationCategory.find_by(name: 'Донорская помощь')
    @organizations = Organization.all.where(active: true).where.not(organization_category_id: @donor.id)
  end

  def organizations_list
    @organization_categories = OrganizationCategory.all.where(active: true).where.not(name: 'Донорская помощь')
    @donor = OrganizationCategory.find_by(name: 'Донорская помощь')
    @organizations = Organization.all.where(active: true).where.not(organization_category_id: @donor.id)
  end

  def donors
    @donor = OrganizationCategory.find_by(name: 'Донорская помощь')
    @organizations = Organization.all.where(active: true).where(organization_category_id: @donor.id)
  end

  def show
    @organization = Organization.find(params[:id])
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :location, :phone, :address, :contact_person,
      :longitude, :latitude, :organization_category_id, :oblast_id, :url, :active)  
  end
end

