class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:unsubscribe]
  before_action :set_user, only: [:show, :unsubscribe]

  def show; end

  def unsubscribe; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
