#require 'pry'
class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :show, :destroy]

	def index
		@comments = Comment.all
	end

	def show
		
	end

	def new
		@comment =Comment.new
	end

	def create
	#	binding.pry
	    @post = Post.find(params[:post_id])
	    
	    @comment = Comment.new(params.require(:comment).permit(:content))
	    #comment.save
	    
	    #@comment = Comment.create(params.require(:comment).permit(:content))
	    
	    @post.comments << @comment
	    @comment.user = current_user
	    
	    if @comment.save
	      redirect_to post_path(@post)
	    else
	      render 'posts/show'
	    end
	end

  def edit
    
  end

	def update
		if @comment.update(comment_params)
      redirect_to @comment
    else
      render :update
    end
	end

	def destroy
		@comment.destroy
	end

private
  def set_comment
    @comment = Comment.find(params[:id])
  end
end