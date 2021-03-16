class BrokerStock < ApplicationRecord

  belongs_to :stock
  belongs_to :broker
end
