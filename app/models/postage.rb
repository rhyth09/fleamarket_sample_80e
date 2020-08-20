class Postage < ActiveHash::Base
  include ActiveHash::Associations
  field :choice
  add id: 1, choice: "送料込み(出品者負担)"
  add id: 2, choice: "着払い(購入者負担)"

  has_many :items
end