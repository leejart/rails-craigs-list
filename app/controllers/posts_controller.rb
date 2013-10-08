class PostsController < ApplicationController
  before_filter :authorize, only: [:edit, :update, :destroy]

  def create
    @category =  Category.find(params[:category_id])
    @post = @category.posts.create(post_params)
    redirect_to category_posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def edit
    @category =  Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts
  end

  def new
    @category =  Category.find(params[:category_id])
    @post = @category.posts.build
  end

  def show
    @category =  Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])

  end

  def update
    @category =  Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])

    if @post.update(params[:post].permit(:title, :content, :price, :category_id))
      redirect_to category_post_path(@category, @post)
    else
      render :edit
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :price,
                :category_id).merge(user_id: current_user.id)
    end

end
