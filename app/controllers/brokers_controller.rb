class BrokersController < ApplicationController
  def show
    @broker = Broker.find(params[:id])
  end

  def show_portfolio
    @broker_stocks = Broker.find(params[:id]).stocks.all
  end

  def show_transaction
    @buyer_stocks = BuyerStock.all
  end
end
