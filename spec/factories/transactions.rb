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
FactoryBot.define do
  factory :transaction do
    type { :order_book }
  end
end
