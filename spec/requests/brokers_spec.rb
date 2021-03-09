require 'rails_helper'

RSpec.describe "Brokers", type: :request do
  let(:broker) {create(:broker)}

  describe "GET /brokers/:id" do
    it "gets Broker show method" do
      get broker_path(broker)
      expect(response).to render_template(:show)
    end
  end
end
