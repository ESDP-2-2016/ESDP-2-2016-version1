class PostCommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :edit]
  before_action :correct_user, only: [:edit]

  def create
    @post_comment = PostComment.new(post_comment_params)
    if @post_comment.save
      redirect_to :back
    end
  end

  def edit
    @post_comment = PostComment.find(params[:id])
    @post = @post_comment.post
  end

  def update
    @post_comment = PostComment.find(params[:id])
    @post = @post_comment.post
    if @post_comment.update(post_comment_params)
      redirect_to (@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post_comment = PostComment.find(params[:id])
    if @post_comment.delete
      redirect_to :back
    else
      render @post_comment
    end
  end


  private

  def post_comment_params
    params.require(:post_comment).permit(:body, :post_id, :user_id)
  end

  def correct_user
    @post_comment = PostComment.find(params[:id])
    redirect_to :back unless current_user == @post_comment.user
  end

end
