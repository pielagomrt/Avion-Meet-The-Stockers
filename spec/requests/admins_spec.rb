require 'rails_helper'


RSpec.describe "Admins", type: :request do
  let(:admin) {create(:admin)}
  let(:broker) {create(:broker)}
  let(:buyer) {create(:buyer)}
  
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
    post create_broker_admin_path, :params => {broker: {first_name: 'Rio', last_name: 'Sevilla', email: 'test@gmail.com', password: 'test123456', password_confirmation: '123456', approved: false}}
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

end
