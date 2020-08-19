class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_year, :birth_month, :birth_day ,presence: true
  has_one :address, dependent: :destroy
  has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :sales_items, -> { where buyer_id: nil }, foreign_key: "seller_id", class_name: "Item"
  has_many :sold_items, -> { where.not buyer_id: nil }, foreign_key: "seller_id", class_name: "Item"
  has_many :items
end
