class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  def index
  	@users = User.all
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    
  end
  
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
  end

  def show_my_posts
    #@user_posts = Post.find(current_user)
    @user_posts = current_user.posts
  end

private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end

end
