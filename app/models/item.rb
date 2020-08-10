class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, presence: true
  validates :price, presence: true
  validates :explain, presence: true
  validates :item_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :postage_id, presence: true
  validates :shipping_date_id, presence: true


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :item_status
  belongs_to_active_hash :postage
end
