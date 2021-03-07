class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @brokers = Broker.all
    @buyers = Buyer.all
  end

  def new_broker
    @broker = Broker.new
  end

  def create_broker
    @broker = Broker.new(broker_create_params)

    if @broker.save
      redirect_to admins_path
    else
      render :new_broker
    end
  end

  def new_buyer
    @buyer = Buyer.new
  end

  def create_buyer
    @buyer = Buyer.new(buyer_create_params)

    if @buyer.save
      redirect_to admins_path
    else
      render :new_buyer
    end
  end

  def edit_broker
    @broker = Broker.find(params[:id])
  end

  def update_broker
    @broker = Broker.find(params[:id])
    if @broker.update(broker_update_params)
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
    if @buyer.update(buyer_update_params)
      redirect_to admins_path
    else
      render :edit_buyer
    end
  end

  private

  def broker_create_params
    params.require(:broker).permit(:first_name, :last_name, :email, :password)
  end

  def broker_update_params
    params.require(:broker).permit(:first_name, :last_name)
  end

  def buyer_create_params
    params.require(:broker).permit(:first_name, :last_name, :email, :password)
  end

  def buyer_update_params
    params.require(:buyer).permit(:first_name, :last_name)
  end
end
