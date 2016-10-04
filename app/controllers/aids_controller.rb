class AidsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @aid = Aid.new
  end

  def create
    @aid = Aid.new(aid_params)
    if @aid.save
      redirect_to :back
    else
      render 'new'
    end
  end

  def edit
    @aid = Aid.find(params[:id])
  end

  def update
    @aid = Aid.find(params[:id])
    if @aid.update(aid_params)
      redirect_to :back
    else
      render 'edit'
    end
  end

  private
  def aid_params
    params.require(:aid).permit(:descripton, :status, :organization_id, :user_id, :post_id)
  end
end
