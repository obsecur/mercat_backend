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
class Address < ApplicationRecord
  # Associations
  belongs_to :user

  # Validations
  validates :city,
            :country,
            :latitude,
            :longitude,
            :street,
            :street_number,
            :zipcode,
            presence: true
end
