class BrokerStocksController < ApplicationController

  def index
    @broker_stocks = BrokerStock.all
  end

  def new
  end

  def create
    @stock = Stock.find(params[:stock_id])
    current_broker.stocks << @stock
    
    if current_broker.save
      redirect_to broker_portfolio_path(current_broker.id)
    end
  end

  def show
    @broker = Broker.find(params[:id])
    @stock = Stock.find(params[:stock_id])
    @broker_stock = BrokerStock.find(params[:id])
  end

  private
  def broker_stock_params
      params.require(:broker_stock).permit(:stock_id, :broker_id)
  end
end




