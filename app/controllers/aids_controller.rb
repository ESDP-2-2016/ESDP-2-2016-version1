class AidsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def create
    @aid = Aid.new(aid_params)
    if @aid.save
      @post = Post.find_by(id: @aid.post_id)
      @authorid = @post.user_id.to_i
      UserMailer.aid_reply(User.find_by(id: @authorid),User.first, current_user, @aid.description).deliver_now
      redirect_to :back
      flash[:success] = 'Ваше сообщение отправлено! Мы свяжемся с Вами в ближайшее время!'
    else
      flash[:error] = 'Произошел сбой! Ваше сообщение не отправлено!'
      redirect_to :back
    end
  end

  def edit
    @aid = Aid.find(params[:id])
    @respond_post = @aid.post
  end

  def update
    @aid = Aid.find(params[:id])
    if @aid.update(aid_params)
      redirect_to user_profile_path(current_user.slug)
    else
      render 'edit'
    end
  end

  def accepted
    @aid = Aid.find(params[:id])
    @aid.status = params[:up_status]
    @aid.save
    if @aid.status == 1
      redirect_to user_profile_path(current_user)
    else
      redirect_to :back
    end

  end

  def destroy
    @aid = Aid.find(params[:id])
    if @aid.delete
      redirect_to user_profile_path(current_user.id)
    else
      render @aid
    end
  end

  private
  def aid_params
    params.require(:aid).permit(:description, :status, :organization_id, :user_id, :post_id)
  end
end
