# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id             :bigint           not null, primary key
#  author_name    :string
#  isbn_code      :string           not null
#  publication_at :date             not null
#  status         :string           default("available"), not null
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require "rails_helper"

describe Book, type: :model do
  subject(:book) { create(:book) }

  describe "Validations" do
    it { should validate_presence_of(:publication_at) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:isbn_code).case_insensitive }
  end

  describe "Associations" do
    it { should have_many(:user_books) }
    it { should have_many(:users) }
    it { should have_many(:transactions) }
  end
end
