#require 'pry'
class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all.each do |post| 
      post.category_name = post.categories.first.name if post.categories.first
    end
    #binding.pry
    #@posts = Post.all.merge({category_name: })
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
  	@post = Post.new
  end

  def create
    #binding.pry
    post = Post.new(post_params)
    post.user = current_user
    category = Category.find(params[:Category][:category_id])
    post.categories << category

    if post.save!
      redirect_to post
    else
      render :new
    end

  end

  def edit

  end

  def update
    #binding.pry
    category = Category.find(params[:Category][:category_id])
    @post.categories << category

    if @post.update(post_params)
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
