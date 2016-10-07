class RegistrationsController < Devise::RegistrationsController
  def show
    @user = User.find(params[:id])
    @owner_organizations = UserOrganization.where(user_id: @user.id, role: 1)
    @participant_organizations = UserOrganization.where(user_id: @user.id, role: 2)
    @aids = Aid.where(user_id: @user.id)
    @organization = Organization.find(params[:id])
  end

  def create
    @user = User.new(sign_up_params)

    if @user.save
      role = 2
      o_user = @user.id
      organization = 1
      # @user_organization.save
      @user_organization = UserOrganization.create!(role: role, user_id: o_user, organization_id: organization)
      redirect_to root_path
    else
      render new
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end

end
