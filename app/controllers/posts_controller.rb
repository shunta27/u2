class PostsController < ApplicationController
  respond_to :html

  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      redirect_to "/users/#{current_user.id}", notice: '記事を投稿しました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:subject, :category_id, :body)
  end
end
