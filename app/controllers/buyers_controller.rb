class BuyersController < ApplicationController
  def show
    @buyer = Buyer.find(params[:id])
  end

  def update
    @buyer = Buyer.find(params[:id])
    @buyer.update(buyer_params)
    redirect_to admins_path
  end

  private

  def buyer_params
    params.require(:buyer).permit(:first_name, :last_name, :email)
  end
end
