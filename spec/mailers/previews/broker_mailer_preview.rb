# Preview all emails at http://localhost:3000/rails/mailers/broker_mailer
class BrokerMailerPreview < ActionMailer::Preview
    def new_broker_pending
        broker = Broker.create(first_name: "John", last_name: "Doe", email: 'to@example.com', password: '123456', password_confirmation: '123456')
        BrokerMailer.new_broker_pending(broker.email)
    end

    def new_broker_approved
        broker = Broker.create(first_name: "John", last_name: "Doe", email: 'to@example.com', password: '123456', password_confirmation: '123456')
        BrokerMailer.new_broker_approved(broker.email)
    end
end
