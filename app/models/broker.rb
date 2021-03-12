class Broker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :first_name, presence: true
         validates :last_name, presence: true

         has_many :broker_stocks
         has_many :stocks, through: :broker_stocks

  after_create :send_broker_mail

  def send_broker_mail
    BrokerMailer.new_broker_pending(email).deliver
  end

  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    approved? ? super : :not_approved
  end
end
