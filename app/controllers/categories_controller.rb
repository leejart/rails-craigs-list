class CategoriesController < ApplicationController

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
  end

  def edit
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(params[:category].permit(:name))
      redirect_to @category
    else
      render :edit
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :category_id, :user_id)
    end

end
