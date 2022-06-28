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
require "rails_helper"

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
