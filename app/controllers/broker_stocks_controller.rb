class BrokerStocksController < ApplicationController
  def new

  end

  def create
    # @broker_stocks.broker_id = current_broker.id
    # @broker_stocks.stock_id = Stock.find(params[:id])

    # @broker = Broker.find(current_broker.id)
    @stock = Stock.find(params[:stock_id])
    current_broker.stocks << @stock

    if current_broker.save
      redirect_to broker_portfolio_path(current_broker.id)
    end
  end


  private
  def broker_stock_params
      params.require(:broker_stock).permit(:stock_id, :broker_id)
  end
end


