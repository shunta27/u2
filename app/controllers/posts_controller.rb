class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @category = @categories.find(params[:category_id])
    @posts = Post
              .where(category_id: params[:category_id])
              .page(params[:page])
              .per(6)
              .default_order
  end

  def users_index
    @user = User.find(params[:user_show_id]).decorate
    @posts = Post
              .where(user_id: params[:user_show_id])
              .page(params[:page])
              .per(10)
              .default_order
  end

  def show
    @reply = Reply.new
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to category_post_path(@post.category_id, @post.id), notice: '記事を投稿しました。'
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    if @post.update(post_params)
      redirect_to category_post_path(@post.category_id, @post.id), notice: '投稿を更新しました。'
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
