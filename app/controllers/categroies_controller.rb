class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = category.new(category_params)

    if @category.save
      redirect_to category_path
    else
      render :new
    end
  end

  def edit
  
  end

  def update
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
  end

private
  
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:user).permit(:name)
  end

end