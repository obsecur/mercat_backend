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
require "rails_helper"

describe User, type: :model do
  subject(:user) { create(:user) }

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "Associations" do
    it { should have_many(:user_books) }
    it { should have_many(:books) }
    it { should have_many(:transactions) }
    it { should have_one(:address) }
  end
end
