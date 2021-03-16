class BuyerStocksController < ApplicationController

    def index
      @buyer_stocks = BuyerStock.all
    end

    def create
      @broker_stock = BrokerStock.find(params[:id])
      current_buyer.broker_stocks << @broker_stock

      if current_buyer.save
        redirect_to buyer_portfolio_path(current_buyer.id)
      end
    end


end
