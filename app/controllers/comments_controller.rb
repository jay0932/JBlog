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
		@comment = Comment.new(comment_params)
		if @comment.save
			 redirect_to @comment
		else
			render :new
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

	def comment_params
		params.require(:commnts).permit(:content, :post_id, :user_id)
	end
end