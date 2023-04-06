require 'rails_helper'

RSpec.describe TopUp, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should belong_to(:account) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:amount) }
end

# == Schema Information
#
# Table name: top_ups
#
#  id             :uuid             not null, primary key
#  amount         :decimal(8, 2)
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
