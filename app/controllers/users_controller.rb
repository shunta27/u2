class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:unsubscribe]
  before_action :set_user, only: [:show, :unsubscribe]

  def show
    @post_count = Post.where(user_id: params[:id]).count
  end

  def unsubscribe
    authorize @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
