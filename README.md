# DB設計

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "items"
- has_many :saling_items, foreign_key: "seller_id", class_name: "items"
- has_many :sold_items, foreign_key: "seller_id", class_name: "items"
- has_one :profile, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :address, dependent: :destroy

## Profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_year|year(4)|null:false|
|birth_month|integer(2)|null:false|
|birth_day|integer(2)|null:false|
|user_id|references|null:false, foreign_key:true|
### Association
- belongs_to :user

## Credit_cardsテーブル
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
|send_first_name|string|null: false|
|send_last_name|string|null: false|
|send_first_name_kana|string|null: false|
|send_last_name_kana|string|null: false|
|postal_code|integer(7)|null: false|
|prefecture|integer|null: false|
|city|string|null:false|
|address|string|null:false|
|build_name|string||
|phone_number|integer||
|user_id|references|null:false, foreign_key:true|
### Association
- belongs_to :user

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|price|integer|null:false|
|explain|text|null:false|
|item_status|references|null:false, foreign_key:true|
|size|string||
|prefecture|integer|null:false|
|postage|references|null:false, foreign_key:true|
|shipping_date|references|null:false, foreign_key:true|
|brand|text||
|category_id|references|foreign_key:true|
|seller_id|references|null:false, foreign_key:true|
|buyer_id|references|foreign_key:true|
### Association
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :images, dependent: :destroy
- belongs_to_active_hash :shipping_date
- belongs_to_active_hash :postage
- belongs_to_active_hash :item-status
- belongs_to :category

## Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|references|foreign_key:true|
### Association
- belongs_to :item

## Categoriseテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items
