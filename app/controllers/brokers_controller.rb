class BrokersController < ApplicationController
  def show
    @broker = Broker.find(params[:id])
  end

  def update
    @broker = Broker.find(params[:id])
    @broker.update(broker_params)
    redirect_to admins_path
  end

  private

  def broker_params
    params.require(:broker).permit(:first_name, :last_name, :email)
    end
end
