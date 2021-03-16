class BuyerStock < ApplicationRecord
    validates :quantity, numericality: { greater_than: 0,  only_integer: true }
    belongs_to :broker_stock
    belongs_to :buyer

    
    # buyer_stock.broker_stock.stock.price.to_f * buyer_stock.quantity
end
