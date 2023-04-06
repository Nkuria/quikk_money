FactoryBot.define do
  factory :top_up do
    
  end
end

# == Schema Information
#
# Table name: top_ups
#
#  id             :uuid             not null, primary key
#  amount         :decimal(8, 2)
#  phone          :string
#  reference_code :string
#  status         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  account_id     :uuid
#
# Indexes
#
#  index_top_ups_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
