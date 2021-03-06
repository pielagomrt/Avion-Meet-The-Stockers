require 'rails_helper'

RSpec.describe Buyer, type: :model do

  context "validation tests" do

    let(:buyer) {build(:buyer)}

    it '1. ensures first name presence' do
      buyer.first_name = nil

      expect(buyer).to_not be_valid
      expect(buyer.errors).to be_present
      expect(buyer).to_not be_valid
    end

    it '2. ensures last name presence' do
      buyer.last_name = nil

      expect(buyer).to_not be_valid
      expect(buyer.errors).to be_present
      expect(buyer).to_not be_valid
   end
  end
end
