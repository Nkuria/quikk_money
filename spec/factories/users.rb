FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    first_name { Faker::Name.name }
    middle_name { Faker::Name.name }
    surname { Faker::Name.name }
    password { Faker::Name.name }
    phone { "+2547#{8.times.map { Random.rand(10) }.join}" }
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
