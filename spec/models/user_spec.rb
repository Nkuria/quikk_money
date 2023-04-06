require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:surname) }
  it { should validate_presence_of(:password_digest) }

  # TODO: build a custom User object using facotry bot and test uniqueness of phone, email and email format
  # it {should validate_uniqueness_of(:phone)}
end

# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  email           :string
#  first_name      :string
#  middle_name     :string
#  password_digest :string           not null
#  phone           :string           not null
#  surname         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
