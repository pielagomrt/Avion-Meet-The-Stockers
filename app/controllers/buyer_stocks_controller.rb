class BuyerStocksController < ApplicationController

    def index
      @buyer_stocks = BuyerStock.all
    end

    def create
      @buyer_stock = BuyerStock.new
      @buyer_stock.broker_stock_id = BrokerStock.find(params[:id]).id
      @buyer_stock.buyer_id = current_buyer.id
      @buyer_stock.quantity = params[:buyer_stock][:quantity]
      if @buyer_stock.save
        redirect_to buyer_portfolio_path(current_buyer.id)
      else
        flash[:notice] = "Quantity must be greater than 0"
      end
    end


end
