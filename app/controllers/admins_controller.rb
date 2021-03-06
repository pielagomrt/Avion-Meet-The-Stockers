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
