class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    case resource
      when Admin then admins_path
      when Broker then broker_path(@broker)
      when Buyer then buyer_path(@buyer)
    end
  end

end
