class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :user
      t.string :city, null: false
      t.string :country, null: false
      t.decimal :latitude, precision: 10, scale: 6, null: false
      t.decimal :longitude, precision: 10, scale: 6, null: false
      t.integer :street_number, null: false
      t.string :zipcode, null: false
      t.string :street, null: false

      t.timestamps
    end
  end
end
