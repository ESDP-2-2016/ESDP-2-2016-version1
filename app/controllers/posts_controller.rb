class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :correct_user, only: [:edit]
  before_filter :only => [:show, :edit, :update, :destroy,:deactivate] do
    @post = Post.find_by_slug!(params[:id])
  end

  def index
    @posts = Post.all.where(active: true).order('id DESC').page(params[:page]).per(20)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save

      flash[:success] = t(".create")
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    # @post = Post.find_by(slug: params[:id])
    @aids = Aid.where(post_id: @post.id, status: 1)
    @aid = Aid.new
    @respond_post = @post
    @user_already_helped
    unless current_user.nil?
      @user_already_helped = Aid.find_by(user_id: current_user.id, post_id: @post.id)
    end
  end

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def deactivate
    # @post = Post.find(params[:id])
    @post.update_attribute(:active, false)

    flash[:success] = 'Вы удалили пост!'
    redirect_to posts_path
  end
  def nonactiveposts
    @post_history = Post.all.where(active: false, user_id: current_user.id)
  end
  def non_active_post
    @nonactivepost = Post.find_by_slug!(params[:id])
  end

  private
  def post_params
      params.require(:post).permit(:title, :body, :keywords, :post_category_id, :organization_id, :user_id, :active)
  end

  def correct_user
    @post = Post.find_by_slug!(params[:id])
    redirect_to(@post) unless current_user == @post.user
  end
end
