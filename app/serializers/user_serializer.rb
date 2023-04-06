class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :surname, :middle_name, :phone, :email

  attributes :account_balance do |user|
    user.account&.balance
  end
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
