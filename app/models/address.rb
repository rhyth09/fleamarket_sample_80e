class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :send_first_name, :send_last_name, :send_first_name_kana, :send_last_name_kana, :postal_code, :prefecture_id, :city, :address ,presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end