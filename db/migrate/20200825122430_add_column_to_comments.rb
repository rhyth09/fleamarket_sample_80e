class AddColumnToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :seller_id, :integer, null: false
  end
end
