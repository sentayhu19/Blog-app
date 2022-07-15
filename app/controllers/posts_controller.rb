class PostsController < ApplicationController
  def index
    author_id = params[:user_id]
    @user = User.find(author_id)
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def show
    @post = Post.includes(:user, comments: [:user]).find(params[:id])
  end
end
