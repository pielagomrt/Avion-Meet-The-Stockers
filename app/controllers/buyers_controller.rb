class BuyersController < ApplicationController

  def show
    @buyer = Buyer.find(params[:id])
  end

  def show_portfolio
    @buyer = Buyer.find(params[:id])
    @buyer_stocks = Buyer.find(params[:id]).broker_stocks
  end


  def show_transaction
    @buyer_stocks = Buyer.find(params[:id]).buyer_stocks.all
  end
end

