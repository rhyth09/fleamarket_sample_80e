class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references  :item, foreign_key: true
      t.string :comment,   null:false
      t.timestamps
    end
  end
end
