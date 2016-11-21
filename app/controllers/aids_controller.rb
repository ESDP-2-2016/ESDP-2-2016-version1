class AidsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def create
    @aid = Aid.new(aid_params)
    if @aid.save
      @idpost = @aid.post_id
      @post = Post.find_by(id: @idpost)
      @authorid = @post.user_id.to_i
      @author = User.find_by(id: @authorid)
      UserMailer.aid_reply(User.find_by(id: @authorid),AdminUser.first).deliver_now
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
      redirect_to user_profile_path(current_user.id)
    else
      render 'edit'
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
