require 'rails_helper'

RSpec.describe Stock, type: :model do
  context "validation tests" do

    let(:stock) {build(:stock)}

    it '1. ensures ticker presence' do
      stock.ticker = nil

      expect(stock).to_not be_valid
      expect(stock.errors).to be_present
      expect(stock).to_not be_valid
    end

    it '2. ensures company presence' do
      stock.company = nil

      expect(stock).to_not be_valid
      expect(stock.errors).to be_present
      expect(stock).to_not be_valid
    end

    it '3. ensures price presence' do
      stock.price = nil

      expect(stock).to_not be_valid
      expect(stock.errors).to be_present
      expect(stock).to_not be_valid
    end
  end
end
