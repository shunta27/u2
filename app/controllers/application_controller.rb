class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :before_action
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  private

  def before_action
    @categories = Category.default_order.all
  end

  def user_not_authorized
    redirect_to(request.referrer || root_path)
  end
end
