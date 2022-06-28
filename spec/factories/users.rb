# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  name       :string           not null
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user do
    name { "John Doe" }
    email { "jdoe@email.com" }
    phone { "+342343412" }

    trait :with_address do
      after(:build) do |user, evaluator|
        user.address = build(:address, user: user)
      end
    end

    trait :with_books do
      after(:create) do |user, evaluator|
        user.user_books << create_list(:user_books, 3)
      end
    end
  end
end
