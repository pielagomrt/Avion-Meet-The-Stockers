class BrokerMailer < ApplicationMailer
  default from: 'from@example.com'
  layout 'mailer'

  def new_broker_pending(email)
    @email = email
    mail(to: @email, subject: 'Account pending for approval')
  end

  def new_broker_approved(email)
    @email = email
    mail(to: @email, subject: 'Account approved')
  end
end
