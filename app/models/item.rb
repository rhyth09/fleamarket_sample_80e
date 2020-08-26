class Item < ApplicationRecord
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, presence: { message: "は一枚以上必須です" }

  validates :name, presence: true
  validates :price, presence: true
  validates :explain, presence: true
  validates :item_status_id, presence: true
  validates :prefecture_id, presence: true
  validates :postage_id, presence: true
  validates :shipping_date_id, presence: true
  validates :seller_id, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :item_status
  belongs_to_active_hash :postage

  def self.search(search)
    if search != ""
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
