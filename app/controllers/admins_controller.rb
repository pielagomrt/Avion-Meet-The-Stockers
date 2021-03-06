class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @brokers = Broker.all
    @buyers = Buyer.all
  end

  def new_broker
    @broker = Broker.new
  end

  def new_buyer
    @buyer = Buyer.new
  end

  def edit_broker
    @broker = Broker.find(params[:id])
  end

  def update_broker
    @broker = Broker.find(params[:id])
    if @broker.update(broker_params)
      redirect_to admins_path
    else
      render :edit_broker
    end
  end

  def edit_buyer
    @buyer = Buyer.find(params[:id])
  end

  def update_buyer
    @buyer = Buyer.find(params[:id])
    if @buyer.update(buyer_params)
      redirect_to admins_path
    else
      render :edit_buyer
    end
  end

  private

  def broker_params
    params.require(:broker).permit(:first_name, :last_name)
  end

  def buyer_params
    params.require(:buyer).permit(:first_name, :last_name)
  end
end

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
  
  private

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end
end
