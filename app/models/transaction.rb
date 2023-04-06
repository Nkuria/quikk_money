class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'

  validates :amount, :status, presence: true

  enum status: %i[completed pending failed]

  after_create :update_sender_balance
  after_create :update_receiver_balance

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
