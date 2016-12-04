class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :correct_user, only: [:edit]
  before_filter :only => [:show, :edit, :update, :destroy,:deactivate, :closed] do
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
    @aids_all = Aid.where(post_id: @post.id)
    @aids = Aid.where(post_id: @post.id, status: 0)
    @aids_real = Aid.where(post_id: @post.id, status: 2)
    @aid = Aid.new
    @respond_post = @post
    @user_already_helped
    unless current_user.nil?
      @user_already_helped = Aid.find_by(user_id: current_user.id, post_id: @post.id)
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def deactivate
    @post.update_attribute(:active, false)
    flash[:success] = t('.deactivate')
    redirect_to posts_path
  end


  def closed
    @post.update_attribute(:open, false)
    redirect_to :back
  end

  def nonactiveposts
    @post_history = Post.all.where(active: false, user_id: current_user.id)
  end

  def non_active_post
    @nonactivepost = Post.find_by_slug!(params[:id])
  end

  def show_aids
    @post = Post.find(params[:this_post_id])
    @aids = @post.aids.where(status: 0)
    unless @aids.empty?
      @aids.each do |aid|
        aid.update_attribute(:status, 1)
      end
    end
    respond_to do |format|
      format.html {redirect_to :back}
      format.js
    end
  end

  private
  def post_params
      params.require(:post).permit(:title, :body, :keywords, :post_category_id, :organization_id, :user_id, :active, :open)
  end

  def correct_user
    @post = Post.find_by_slug!(params[:id])
    redirect_to(@post) unless current_user == @post.user
  end

  def aid_params
    params.require(:aid).permit(:description, :status, :organization_id, :user_id, :post_id)
  end

end
