# Preview all emails at http://localhost:3000/rails/mailers/transaction
class TransactionPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/transaction/transaction_notification
  def transaction_notification
    TransactionMailer.transaction_notification
  end

end
