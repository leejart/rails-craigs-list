class PostsController < ApplicationController

  def create
    @category =  Category.find(params[:category_id])
    @post = @category.posts.create(:title, :content, :price, :category_id, 
                      user_id: current_user.id)
    redirect_to category_posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    category = Category.find(params[:category_id])
    @posts = category.posts
  end

  def new
    @category =  Category.find(params[:category_id])
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
