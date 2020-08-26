# DB設計

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|last_name|string|null:false|
|first_name|string|null:false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|year(4)|null:false|
|birth_month|integer(2)|null:false|
|birth_day|integer(2)|null:false|
### Association
- has_many :bought_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :sales_items, foreign_key: "seller_id", class_name: "Item"
- has_many :sold_items, foreign_key: "seller_id", class_name: "Item"
- has_one :credit_card, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :comments, dependent: :destroy

## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null:false, foreign_key:true|
### Association
- belongs_to :user

## Addressテーブル
|Column|Type|Options|
|------|----|-------|
|send_last_name|string|null: false|
|send_first_name|string|null: false|
|send_last_name_kana|string|null: false|
|send_first_name_kana|string|null: false|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null:false|
|address|string|null:false|
|build_name|string||
|phone_number|string||
|user_id|references|null:false, foreign_key:true|
### Association
- belongs_to :user

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|price|integer|null:false|
|explain|text|null:false|
|item_status_id|integer|null:false|
|size|string||
|prefecture_id|integer|null:false|
|postage_id|integer|null:false|
|shipping_date_id|integer|null:false|
|brand|text||
|category_id|references|foreign_key:true|
|seller_id|integer|null:false|
|buyer_id|integer||
### Association
- belongs_to :seller, class_name: "User", foreign_key: "seller_id"
- belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_date
- belongs_to_active_hash :postage
- belongs_to_active_hash :item-status
- belongs_to :category

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|references|null:false, foreign_key:true|
### Association
- belongs_to :item

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items

## Comments_tableテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false, foreign_key: true|
|user_id|references|null:false, foreign_key: true|
|comment|text|null:false|
### Association
- belongs_to :user
- belongs_to :item

