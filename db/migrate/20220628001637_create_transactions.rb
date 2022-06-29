class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.string :type, null: false
      t.date :operation_at, null: false
      t.datetime :expires_at

      t.timestamps
    end
  end
end
