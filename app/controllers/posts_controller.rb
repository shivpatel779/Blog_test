class PostsController < ApplicationController
  before_action :find_user, except: :new

  def index
    @posts = @user&.posts
  end

  def new
    @posts =Post.new
  end

  #Api for Show all post
  def show_all_post
    posts = @user.posts
    render json: {post: posts}
  end

  def create
    @user.posts.create(post_params) if @user
    redirect_to posts_path(user_id: params[:user_id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path(user_id: params[:user_id])
  end

  private

  def post_params
    params.permit(:title, :content, :user_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
