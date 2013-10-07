class PostsController < ApplicationController

  def create
    category =  Category.find([:id])
    @post = Post.new(post_params, category.id)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:title, :content, :price, :category_id))
      redirect_to @post
    else
      render :edit
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :price, :category_id, :user_id)
    end

end