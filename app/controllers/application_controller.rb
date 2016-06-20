class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:password,
                         :phone_number,
                         :remember_me)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name,
                         :password,
                         :password_confirmation,
                         :phone_number,
                         :state)
    end
  end

  private

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || confirm_user_path(resource_or_scope)
  end
end
