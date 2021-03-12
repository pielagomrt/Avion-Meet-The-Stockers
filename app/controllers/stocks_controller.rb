class StocksController < ApplicationController
  before_action :test

  # def index
  #   # @current_price = @client.company('MSFT').company_name
  # end

  # def new
  #   @stock = Stock.new
  # end

  # def create
  #   @stock = Stock.new(stock_create_params)

  #   if @stock.save
  #     redirect_to admins_path
  #   else
  #     render :new_broker
  #   end
  # end



private
  def test
    @client = IEX::Api::Client.new(
    publishable_token: 'pk_b80fe862282642169f72829236149ccc',
    secret_token: 'sk_b22f82653c6a4cf8891a943950392693',
    # secret_token: Rails.application.credentials.secret_token,
    endpoint: 'https://cloud.iexapis.com/v1'
    )
  end

  def stock_create_params
    params.require(:stock).permit(:ticker, :company, :price)
  end

end
