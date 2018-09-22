class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index; end

  def show
    @reply = Reply.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to user_show_path(current_user), notice: '記事を投稿しました。'
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    if @post.update(post_params)
      redirect_to user_show_path(current_user), notice: '投稿を更新しました。'
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:subject, :category_id, :body)
  end

  def set_post
    @post = Post.find(params[:id]).decorate
  end
end
