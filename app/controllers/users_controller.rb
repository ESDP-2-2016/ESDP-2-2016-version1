class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @owner_organizations = UserOrganization.where(user_id: @user.id, role: 1)
    @participant_organizations = UserOrganization.where(user_id: @user.id, role: 2)
    @aids = Aid.where(user_id: @user.id)
  end
end
