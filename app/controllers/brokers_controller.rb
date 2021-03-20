class BrokersController < ApplicationController
  def show
    @broker = Broker.find(params[:id])
  end

  def show_portfolio
    @broker = current_broker
    @broker_admin = Broker.find(params[:id])
    @broker_stocks = Broker.find(params[:id]).stocks.all
    @buyer_stocks = BuyerStock.all
  end

  def show_transaction
    @buyer_stocks = BuyerStock.all
  end
end
