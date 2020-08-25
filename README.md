# README

<h1 align="center">フリーマーケットサイト</h1>

- メルカリクローンのフリーマーケットサイトです。
- TECH::EXPERT 80期短期集中コースEチームで作成。
- 作成期間 2020/8/4 ~ 2020/8/28
- ![top_page](https://gyazo.com/5f8ad3d59bbf3a99c045666419a31795)



## 機能紹介
- 新規会員登録・ログインをすると商品の購入、出品ができます。
- 新規会員登録、ログインがお済みでない方も商品の一覧、詳細を閲覧可能です。
- 決済方法は、ご自身のクレジットカードを登録して購入できます。

## 制作メンバー&実装内容の紹介
### 熊谷諒
- スクラムマスター
- 必要なDBの変更、更新
- ログイン、新規登録機能(ビュー、サーバーサイド)
- ログアウト(ビュー)
- クレジットカード登録（Payjp)
- クレジットカード情報表示(Payjp)
- 商品購入機能（Payjp)

### 小林成美
- ER図作成
- 必要なDBの変更、更新
- トップページ(ビュー)
- 商品出品機能(サーバーサイド)
- 商品編集ページ(ビュー)
- 商品情報編集機能(サーバーサイド)
- ルーティング調整

### 熊谷直樹
- ER図作成
- 必要なDBの変更、更新
- 商品出品ページ(ビュー)
- 商品購入確認ページ(ビュー)
- 商品カテゴリ機能(サーバーサイド)
- 商品詳細表示(サーバーサイド)

### 村松大輔
- デプロイ担当
- 必要なDBの変更、更新
- マイページ(ビュー)
- 商品一覧表示(サーバーサイド)
- 発表会スライド

### 牧田鹿文彦
- READ.ME作成
- 必要なDBの変更、更新
- 商品詳細ページ(ビュー)
- 商品削除機能(サーバーサイド)

## サイトURL紹介
- ユーザー名:
- パスワード:
- IPアドレス:http://18.177.240.139/


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
