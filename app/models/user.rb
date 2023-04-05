class User < ApplicationRecord
  validates :phone, :first_name, :surname, :password_digest, presence: true
  validates :phone, uniqueness: true
  validates :email, uniqueness: { allow_blank: true }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end
