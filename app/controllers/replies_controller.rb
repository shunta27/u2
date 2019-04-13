class RepliesController < ApplicationController
  def create
    @reply = Reply.new(reply_params.merge(user_id: current_user.id))
    if @reply.save
      redirect_back(fallback_location: root_path, notice: 'コメントを投稿しました。')
    else
      @post = Post.find(reply_params[:post_id]).decorate
      render template: "posts/show"
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:post_id, :body)
  end
end
