class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.date :publication_at, null: false
      t.string :author_name
      t.string :isbn_code, null: false
      t.string :status, default: "available", null: false

      t.timestamps
    end
  end
end
