require 'rails_helper'


RSpec.describe "Admins", type: :request do
  let(:admin) {create(:admin)}
  let(:broker) {create(:broker)}
  let(:buyer) {create(:buyer)}
  let(:attrs_broker) {attributes_for(:broker)}
  let(:attrs_buyer) {attributes_for(:buyer)}
  
  before(:each) do
    login_as(admin)
  end

  describe "GET /admins" do
    it "1. gets admin index path" do
      get admins_path
      expect(response).to render_template(:index)
    end
  end

  describe "creates a new broker account" do
    it "1. gets admin new broker path" do
      get new_broker_admin_path
      expect(response).to render_template(:new_broker)
    end
    it "2. gets admin post broker path" do
    post create_broker_admin_path, params: { broker: attrs_broker }
    expect(response).to redirect_to admins_path
    end
  end

  describe "GET /admins/pending/broker" do
    it "1. gets admin pending broker path" do
      get pending_broker_signup_admin_path
      expect(response).to render_template(:pending_broker_signup)
    end
  end

  describe "broker approval process" do
    it "1. sends an email to broker when approved" do
      put approve_broker_admin_path(broker)
      expect(response).to redirect_to admins_path
      expect(ActionMailer::Base.deliveries.count).to eq 2
    end
  end

  describe "creates a new buyer account" do
    it "1. gets admin new buyer path" do
      get new_buyer_admin_path
      expect(response).to render_template(:new_buyer)
    end

    it "2. gets admin post buyer path" do
      post create_buyer_admin_path, params: { buyer: attrs_buyer }
      expect(response).to redirect_to admins_path
    end
  end

  describe "updates a broker account" do
    it "1. gets admin edit broker path" do
      get edit_broker_admin_path(broker)
      expect(response).to render_template(:edit_broker)
    end

    it "2. gets admin update broker path" do
      put update_broker_admin_path(broker), params: { broker: attrs_broker }
      expect(response).to redirect_to admins_path
    end
  end

  describe "updates a buyer account" do
    it "1. gets admin edit buyer path" do
      get edit_buyer_admin_path(buyer)
      expect(response).to render_template(:edit_buyer)
    end

    it "2. gets admin update buyer path" do
      put update_buyer_admin_path(buyer), params: { buyer: attrs_buyer }
      expect(response).to redirect_to admins_path
    end
  end

end
