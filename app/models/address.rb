class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :send_first_name, :send_last_name, :send_first_name_kana, :send_last_name_kana, :postal_code, :prefecture, :city, :address, :build_name, :phone_number ,presence: true
end