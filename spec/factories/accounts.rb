FactoryBot.define do
  factory :account do
    balance { 0 }
    association :user, factory: :user, strategy: :create
  end
end

# == Schema Information
#
# Table name: accounts
#
#  id         :uuid             not null, primary key
#  balance    :decimal(12, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
