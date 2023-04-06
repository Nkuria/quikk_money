require 'rails_helper'

RSpec.describe Transaction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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
