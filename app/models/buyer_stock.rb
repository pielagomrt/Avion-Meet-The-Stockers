class BuyerStock < ApplicationRecord
    belongs_to :broker_stock
    belongs_to :buyer
end
