class PostsController < ApplicationController
  def index
    author_id = params[:user_id]
    @user = User.find(author_id)
    @posts = Post.includes(:user).where(user: params[:user_id])
  end

  def show
    @post = Post.includes(:user, comments: [:user]).find(params[:id])
  end

  def create
    post = params[:post]
    user = User.find(params[:user_id])
    new_post = Post.new(post.permit(:title, :text))
    new_post.comments_counter = 0
    new_post.likes_counter = 0
    new_post.author_id = user.id

    if new_post.save
      flash[:notice] = 'New post created successfully.'
      redirect_to user_post_url(user, new_post)
    else
      flash[:error] = 'Creating new post failed!'
      @post = new_post
      render :new
    end
    def destroy_post
      post = Post.find(params[:id])
      post.destroy
      redirect_to user_posts_url(post.author_id)
    end
  end

  def new
    @post = Post.new
    render :new
  end
end
