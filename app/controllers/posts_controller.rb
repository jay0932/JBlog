class ApplicationController < ActionController::Base
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def show
  
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :post
    end

  end

  def edit

  end

  def update
    if @post.update(params[:id])
      redirect_to @post
    else
      render :edit
    end
  end 

  def destroy
    @post.destroy
  end

private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end


end