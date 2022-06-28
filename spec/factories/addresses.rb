# frozen_string_literal: true

# == Schema Information
#
# Table name: addresses
#
#  id            :bigint           not null, primary key
#  city          :string           not null
#  country       :string           not null
#  latitude      :decimal(10, 6)   not null
#  longitude     :decimal(10, 6)   not null
#  street        :string           not null
#  street_number :integer          not null
#  zipcode       :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
FactoryBot.define do
  factory :address do
    user
    city { "London" }
    country { "UK" }
    latitude { 38.7160429 }
    longitude { 62.2713069 }
    street { "Brick Lane" }
    street_number { 123 }
    zipcode { "12345" }
  end
end
