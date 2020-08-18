class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user,                null: false, foreign_key: true
      t.string :send_last_name,          null: false
      t.string :send_first_name,         null: false
      t.string :send_last_name_kana,     null: false
      t.string :send_first_name_kana,    null: false
      t.string :postal_code,            null: false
      t.integer :prefecture,             null: false
      t.string :city,                    null: false
      t.string :address,                 null: false
      t.string :build_name
      t.string :phone_number
      t.timestamps
    end
  end
end
