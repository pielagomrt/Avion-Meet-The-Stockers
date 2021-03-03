class BrokersController < ApplicationController
    def show
        @broker = Broker.find(params[:id])
    end
end
