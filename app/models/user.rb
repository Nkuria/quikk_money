class User < ApplicationRecord
  validates :phone, :first_name, :surname, :password_digest, presence: true
  validates :phone, uniqueness: true
  validates :email, uniqueness: { allow_blank: true }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  has_one :account, dependent: :destroy

  has_secure_password
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
