FactoryBot.define do
  factory :transaction do
    sender_id { "" }
    receiver_id { "" }
    amount { "9.99" }
  end
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
