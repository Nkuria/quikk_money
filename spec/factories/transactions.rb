FactoryBot.define do
  factory :transaction do
    amount { 100 }
    sender { create(:user) }
    receiver { create(:user) }
    status { 0 }
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
