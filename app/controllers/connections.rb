class ConnectionsController < ApplicationController
  def index
    @connections = Connection.All
  end
  def show
    @connection = Connection.find(params[:id])
  end

  def new
    @connection = Connection.new
  end

  def create
    @post = Post.find(params[:post_id])
    @category = Category.find(params[:category_id])
    @connection = @post.connection.build(params.require(:connection).permit(:post_id, :category_id))
    if @connection.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end

  end
end