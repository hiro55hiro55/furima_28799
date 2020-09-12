class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code
      t.string  :city
      t.string :addresses
      t.string :phone_number
      t.integer :shop_id, foreign_key: true
      t.integer :address_prefecture_id
      t.string :buildings
      t.timestamps
    end
  end
end
