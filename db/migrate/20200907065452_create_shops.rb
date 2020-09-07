class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      
      t.integer :user_id, foreign_key: true
      t.integer :item_id, foreign_key: true

      t.timestamps
    end
  end
end
