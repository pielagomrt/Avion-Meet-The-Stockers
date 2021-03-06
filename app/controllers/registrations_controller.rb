class RegistrationsController < Devise::RegistrationsController
  # modify built-in code from devise gem
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication? && admin_signed_in?
        set_flash_message! :notice, :signed_up
        expire_data_after_sign_in!
        respond_with resource, location: admins_path
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_in_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
  
  
  protected

  def after_update_path_for(resource)
    case resource
      when Admin then admins_path
      when Broker then broker_path(@broker)
      when Buyer then buyer_path(@buyer)
    end
  end

 private

 def sign_up_params
  devise_parameter_sanitizer.sanitize(:sign_up)
 end

end
