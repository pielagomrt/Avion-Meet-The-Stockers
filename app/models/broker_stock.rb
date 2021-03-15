class BrokerStock < ApplicationRecord
  belongs_to :stock
  belongs_to :broker

  has_many :buyer_stocks
  has_many :buyers, through: :buyer_stocks
end
