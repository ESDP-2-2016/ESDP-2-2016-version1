class RegistrationsController < Devise::RegistrationsController

  def show
    @user = User.find(params[:id])
    @owner_organizations = UserOrganization.where(user_id: @user.id, role: 1)
    # @massiv=[]
    #
    # @owner_organizations.each do |item|
    #   qw=item.organization_id
    #   @massiv.push qw
    # end

    @requests=[]
    # @massiv.each do |id|
    #   @request= UserOrganization.where(organization_id:id,role:2,approved:false)
    #     @request.each do |item|
    #       @requests.push item
    #     end
    # end
    #

    @owner_organizations.each do |test|
      @request= UserOrganization.where(organization_id:test.organization_id,role:2,approved:false)
      @request.each do |item|
        @requests.push item
      end
    end




      @participant_organizations = UserOrganization.where(user_id: @user.id, role: 2, approved: true)
    @waiting_for_approval = UserOrganization.where(user_id: @user.id, role: 2, approved: false)
    @aids = Aid.where(user_id: @user.id)
  end
  #<UserOrganization id: 19, role: 2, user_id: 1, organization_id: 7, created_at:
  # "2016-10-26 09:53:03", updated_at: "2016-10-26 09:53:03", approved: false>


  def create
    if verify_recaptcha
    super
      role = 2
      o_user = @user.id
      organization = 1
      @user_organization = UserOrganization.create!(role: role, user_id: o_user, organization_id: organization)

    flash[:success] = 'Вы успешно зарегистрировались!'
    else
      redirect_to :back
      end
  end
end
