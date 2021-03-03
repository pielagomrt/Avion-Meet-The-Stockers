class AdminsController < ApplicationController

    def index
        @brokers = Broker.all
        @buyers = Buyer.all
    end
end
