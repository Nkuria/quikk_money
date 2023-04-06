require 'rails_helper'

RSpec.describe Notification, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:message) }
  it { should validate_presence_of(:reference_code) }
  it { should validate_presence_of(:title) }
end

# == Schema Information
#
# Table name: notifications
#
#  id             :uuid             not null, primary key
#  message        :string
#  reference_code :string
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :uuid
#
# Indexes
#
#  index_notifications_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
