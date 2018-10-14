class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :before_action
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  unless Rails.env.development?
    rescue_from Exception, with: :_render_500
    rescue_from ActiveRecord::RecordNotFound, with: :_render_404
    rescue_from ActionController::RoutingError, with: :_render_404
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :profile_text])
  end

  private

  def before_action
    @categories = Category.default_order.all
  end

  def user_not_authorized
    redirect_to(request.referrer || root_path)
  end

  def _render_404(e = nill)
    logger.info "Rendering 404 with exception: #{e.message}" if e

    render :layout => nil, template: 'errors/404', status: 404
  end

  def _render_500(e = nill)
    logger.error "Rendering 500 with exception: #{e.message}" if e
    ExceptionNotifier.notify_exception(e, :env => request.env, :data => {:message => "500 error"})

    render :layout => nil, template: 'errors/500', status: 500
  end
end
