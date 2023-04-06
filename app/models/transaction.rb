class Transaction < ApplicationRecord
  require 'csv'
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  validates :amount, :status, presence: true

  enum status: %i[completed pending failed]

  after_create :update_sender_balance
  after_create :update_receiver_balance
  after_create :create_notification

  def update_sender_balance
    sender_account = sender.account
    sender_balance = sender_account.balance - amount

    sender_account.update(balance: sender_balance)
  end

  def update_receiver_balance
    receiver_account = receiver.account
    receiver_balance = receiver_account.balance + amount

    receiver_account.update(balance: receiver_balance)
  end

  def create_notification
    Notification.create(user: receiver, title: "New Transaction", message: "Hello #{receiver.first_name}, You have received #{amount} from #{sender.first_name}")
    TransactionNotificationJob.perform_later(self)
  end

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << ['ID', 'Sender', 'Receiver', 'Amount', 'Created At']
      all.each do |transaction|
        csv << [transaction.id, transaction.sender.email, transaction.receiver.email, transaction.amount, transaction.created_at]
      end
    end
  end
end

# == Schema Information
#
# Table name: transactions
#
#  id          :uuid             not null, primary key
#  amount      :decimal(8, 2)
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :uuid
#  sender_id   :uuid
#
