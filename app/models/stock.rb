class Stock < ApplicationRecord
  validates :ticker, presence: true
  validates :company, presence: true
  validates :price, presence: true

  has_many :broker_stocks
  has_many :brokers, through: :broker_stocks
end
