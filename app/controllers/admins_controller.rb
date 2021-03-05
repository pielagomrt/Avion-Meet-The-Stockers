class AdminsController < ApplicationController
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

  def edit_buyer
    @buyer = Buyer.find(params[:id])
  end
end
