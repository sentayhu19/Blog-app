class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show; end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments or /comments.json
  def create
    user = User.find(params[:user_id])
    post = Post.find(params[:post_id])
    puts user, post.comments_counter
    comment = params[:comment]
    new_comment = Comment.new(comment.permit(:text))
    new_comment.author_id = user.id
    new_comment.post_id = post.id
    if new_comment.save
      redirect_to user_post_url(user, post)
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:text)
  end
end
