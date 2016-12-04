class RegistrationsController < Devise::RegistrationsController

  def show
    @user = User.find_by(slug: params[:id])
    @owner_organizations = UserOrganization.where(user_id: @user.id, role: 1)
    @requests=[]
    @owner_organizations.each do |test|
      @request= UserOrganization.where(organization_id:test.organization_id,role:2,approved:false)
      @request.each do |item|
        @requests.push item
      end
    end
    @participant_organizations = UserOrganization.where(user_id: @user.id, role: 2, approved: true)
    @waiting_for_approval = UserOrganization.where(user_id: @user.id, role: 2, approved: false)
    @aids = Aid.where(user_id: @user.id).order('created_at DESC')
    @opened_posts = Post.where(user_id: @user.id, post_category_id: 1, active: true, open: true).order('created_at DESC')
  end

  def create
    if verify_recaptcha
    super
      role = 2
      o_user = @user.id
      organization = 1
      @user_organization = UserOrganization.create!(role: role, user_id: o_user, organization_id: organization,approved:true)
    # flash[:success] = 'Вы успешно зарегистрировались!'

    else
      redirect_to :back
      end
  end
end
