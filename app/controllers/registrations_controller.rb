class RegistrationsController < Devise::RegistrationsController

  def show
    @user = User.find(params[:id])
    @owner_organizations = UserOrganization.where(user_id: @user.id, role: 1)
    @participant_organizations = UserOrganization.where(user_id: @user.id, role: 2)
    @aids = Aid.where(user_id: @user.id)
    @organization = UserOrganization.find(@user)
  end

  def create
    super
      role = 2
      o_user = @user.id
      organization = 1
      @user_organization = UserOrganization.create!(role: role, user_id: o_user, organization_id: organization)
  end
end
