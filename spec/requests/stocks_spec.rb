require 'rails_helper'

RSpec.describe "Stocks", type: :request do
  let(:stock) {create(:stock)}
  let(:attrs_stock) {attributes_for(:stock)}

  describe "GET /stocks" do
    it "1. gets stock index path" do
      get stocks_path
      expect(response).to render_template(:index)
    end
  end

  describe "creates a new instance of stock" do
    it "1. gets stock new path" do
      get new_stock_path
      expect(response).to render_template(:new)
    end
    it "2. gets stock post path" do
      post stocks_path, params: { stock: attrs_stock }
      expect(response).to redirect_to stock_path(Stock.last)
    end
  end

  describe "GET /stocks/:id" do
    it "gets Stock show method" do
      get stock_path(stock)
      expect(response).to render_template(:show)
    end
  end
end
