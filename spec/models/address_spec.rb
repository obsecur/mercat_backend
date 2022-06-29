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

describe Address, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:street_number) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
  end
end
