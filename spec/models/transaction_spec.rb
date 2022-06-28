# frozen_string_literal: true

# == Schema Information
#
# Table name: transactions
#
#  id           :bigint           not null, primary key
#  expires_at   :datetime
#  operation_at :date             not null
#  type         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  book_id      :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_transactions_on_book_id  (book_id)
#  index_transactions_on_user_id  (user_id)
#
require "rails_helper"

describe Transaction, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:operation_at) }
  end

  describe "Associations" do
    it { should belong_to(:user) }
    it { should belong_to(:book) }
  end
end
