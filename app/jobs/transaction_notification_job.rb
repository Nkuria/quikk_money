class TransactionNotificationJob < ApplicationJob
  queue_as :default

  def perform(transaction)
    TransactionMailer.transaction_notification(transaction).deliver_later
  end
end
