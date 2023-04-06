class TransactionMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.transaction_mailer.transaction_notification.subject
  #
  default from: 'nkuria01@gmail.com'
  def transaction_notification(transaction)
    @transaction = transaction
    @receiver = transaction.receiver
    @sender = transaction.sender

    mail(to: transaction.receiver.email, subject: "New Transaction")
  end
end
