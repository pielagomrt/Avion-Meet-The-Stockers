class BuyersController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
  end


  def show_portfolio
    @buyer_stocks = Buyer.find(params[:id]).buyer_stocks.all
  end


  def show_transaction
    @buyer_stocks = Buyer.find(params[:id]).buyer_stocks.all
  end
end

