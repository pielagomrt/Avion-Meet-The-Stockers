class StocksController < ApplicationController
  before_action :test

  def index
   @stocks = @client.stock_market_list(:mostactive).slice(0,10)
   @stocks_search = Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new
    @stock.ticker = @client.company(params[:stock][:ticker]).symbol
    @stock.company = @client.company(params[:stock][:ticker]).company_name
    @stock.price = @client.quote(params[:stock][:ticker]).latest_price

    if @stock.save
      redirect_to stocks_path
    else
      render :new
    end
  end


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
    params.require(:stock).permit(:ticker)
  end

end
