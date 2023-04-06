class Notification < ApplicationRecord
    belongs_to :user

    validates :message, :title, :reference_code, presence: true
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
