require 'rails_helper'

RSpec.describe Broker, type: :model do
  context "validation tests" do

    let(:broker) {build(:broker)}

      it '1. ensures first name presence' do
        broker.first_name = nil

       expect(broker).to_not be_valid
       expect(broker.errors).to be_present
       expect(broker).to_not be_valid
    end

    it '2. ensures last name presence' do
      broker.last_name = nil

      expect(broker).to_not be_valid
      expect(broker.errors).to be_present
      expect(broker).to_not be_valid
   end
  end
end
