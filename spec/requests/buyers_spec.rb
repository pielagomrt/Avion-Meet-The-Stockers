require 'rails_helper'

RSpec.describe "Buyers", type: :request do
  let(:buyer) {create(:buyer)}
  let(:attrs_buyer) {attributes_for(:buyer)}

  describe "GET /buyers/:id" do
    it "gets Buyers show method" do
      get buyer_path(buyer)
      byebug
      expect(response).to render_template(:show)
    end
  end
end
