class Transaction < ApplicationRecord
    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'
end

# == Schema Information
#
# Table name: transactions
#
#  id          :uuid             not null, primary key
#  amount      :decimal(8, 6)
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :uuid
#  sender_id   :uuid
#
