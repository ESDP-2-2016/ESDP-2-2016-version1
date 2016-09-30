class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :correct_user, only: [:edit]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = PostComment.where(post_id: @post.id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.delete
      redirect_to root_path
    else
      render @post
    end
  end

  private

  def post_params
      params.require(:post).permit(:title, :body, :post_category_id, :organization_id, :user_id)

  end

  def correct_user
    @post = Post.find(params[:id])
    redirect_to(@post) unless current_user == @post.user
  end
end
