class StocksController < ApplicationController
  before_action :test

  def index
   @stocks_search = Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create
    @ticker = @client.company(params[:stock][:ticker]).symbol
    @company = @client.company(params[:stock][:ticker]).company_name
  
    @stock = Stock.find_or_create_by(ticker: @ticker, company: @company)

    @stock.price = @client.quote(params[:stock][:ticker]).latest_price
    
    if @stock.save
      redirect_to stock_path(@stock)
    else
      render :new
    end
  end

  def show
    @stock = Stock.find(params[:id])
  end

private
  def test
    @client = IEX::Api::Client.new(
    publishable_token: 'pk_b80fe862282642169f72829236149ccc',
    secret_token: Rails.application.credentials.secret_token,
    # secret_token: Rails.application.credentials.secret_token,
    endpoint: 'https://cloud.iexapis.com/v1'
    )
  end

  def stock_create_params
    params.require(:stock).permit(:ticker)
  end

end

