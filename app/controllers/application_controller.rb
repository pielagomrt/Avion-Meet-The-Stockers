class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :current_password)}
  end

  def after_sign_in_path_for(resource)
    case resource
       when Admin then admins_path
       when Broker then broker_path(@broker)
       when Buyer then buyer_path(@buyer)
    end
  end

end
