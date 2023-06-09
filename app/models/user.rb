class User < ApplicationRecord
  validates :phone, :first_name, :surname, :password_digest, presence: true
  validates :phone, uniqueness: true
  validates :email, uniqueness: { allow_blank: true }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  has_one :account, dependent: :destroy
  has_many :top_ups, through: :account
  has_many :sent_transactions, class_name: 'Transaction', foreign_key: 'sender_id'
  has_many :received_transactions, class_name: 'Transaction', foreign_key: 'receiver_id'
  has_many :notifications
  has_secure_password

  after_create :create_account

  def create_account
    Account.create(balance: 0.0, user: self)
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
