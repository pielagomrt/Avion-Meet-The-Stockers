require "rails_helper"

RSpec.describe BrokerMailer, type: :mailer do
  let(:broker) {create(:broker)}

  describe "1. new broker pending approval" do
    let(:mail) {BrokerMailer.new_broker_pending(broker.email)}

    it "renders the headers" do
      expect(mail.subject).to eq("Account pending for approval")
      expect(mail.to).to eq([broker.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_content("registered")
    end
  end

  describe "2. new broker approved" do
    let(:mail) {BrokerMailer.new_broker_approved(broker.email)}

    it "renders the headers" do
      expect(mail.subject).to eq("Account approved")
      expect(mail.to).to eq([broker.email])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_content("approved")
    end
  end
end
