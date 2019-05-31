class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_not_found
    render file: '/public/404.html.erb', status: 404
  end

  private
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  private
  # Overwriting the sign_in redirect path method
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || me_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username name])
  end


end
