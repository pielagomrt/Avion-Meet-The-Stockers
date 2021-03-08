class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @brokers = Broker.where(approved: true)
    @buyers = Buyer.where('confirmed_at IS NOT NULL')
    @buyers_not_confirmed = Buyer.where('confirmed_at IS NULL')
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

  def pending_broker_signup
    @brokers = Broker.where(approved: false)
  end

  def approve_broker_signup
    @broker = Broker.find(params[:id])
    @email = @broker.email
    @broker.approved = true
    if @broker.save
      flash[:notice] = "Broker is approved"
      redirect_to admins_path
      BrokerMailer.new_broker_approved(@email).deliver_now
    else
      flash[:alert] = "Broker approve failure"
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
    params.require(:buyer).permit(:first_name, :last_name, :email, :password)
  end

  def buyer_update_params
    params.require(:buyer).permit(:first_name, :last_name)
  end
end
