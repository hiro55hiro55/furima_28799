# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| surname  | string | null: false |
| name     | string | null: false |
| surname_phonetic  | string | null: false |
| name_phonetic  | string | null: false |
| nikname  | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| password_confirmation | string | '': false |
| date | string | null: false |

### Association

- has_many :items
- has_many :shops
## item テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    | references | null: false |   <!-- 画像  -->
| item_name   | string | null: false |  <!-- 商品名 -->
| item_explanation | string | null: false |<!-- 商品説明 -->
| category | string | null: false |<!-- カテゴリー -->
| item_status | string | null: false |<!-- 商品の状態 -->
| item_status | string | null: false |<!-- 商品の状態 -->
| shipping_charges | string | null: false |<!-- 配送料の負担 -->
| shipping_region | string | null: false |<!-- 配送料の地域 -->
| days_until_shipping | string | null: false |<!-- 配送料の負担 -->
| price    | string | null: false |<!-- 価格 -->
| sales_commission    | string | null: false |<!-- 販売手数料 -->
| sales_profit    | string | null: false |<!-- 販売利益 -->


### Association
- belongs_to :user
- has_one    :shop 
- has_one: address
## shopテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user     | references | null: false,foreign_key: true |
| item     | references | null: false,foreign_key: true |
### Association
- belongs_to  :item 
- belongs_to :user
- has_one:address

## addressテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal_code    | string | null: false |
| prefecter      | integer | null: false , foreign_key:true |
| city           | string | null: false |
| house_number   | string | null: false |
| building_name  | string | null: false |
| Tell           | string | null: false |
| shop     | references | null: false,foreign_key: true |
### Association
- belongs_to  :shop