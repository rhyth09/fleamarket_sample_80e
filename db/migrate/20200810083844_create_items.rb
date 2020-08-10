class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :explain, null: false
      t.string :size
      t.text :brand
      t.references :category, foreign_key: true
      
      t.integer :prefecture_id, null: false
      t.integer :shipping_date_id, null: false
      t.integer :item_status_id, null: false
      t.integer :postage_id, null: false
      t.timestamps
    end
  end
end
