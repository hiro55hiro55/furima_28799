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
| email    | string | null: false |<!-- 登録アドレス -->
| encrypted_password | string | null: false |<!-- パスワード -->
| encrypted_password_confirmation | string | '': false |<!-- パスワードの確認 -->
| birthday | date | null: false |<!-- 誕生日 -->
| surname  | string | null: false |<!-- 姓 -->
| name     | string | null: false |<!-- 名 -->
| surname_phonetic  | string | null: false |<!-- 姓(カタカナ） -->
| name_phonetic  | string | null: false |<!-- 名(カタカナ） -->
| nikname  | string | null: false |<!-- ニックネーム -->


### Association

- has_many :items
- has_many :shops
## item テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    | references | null: false |   <!-- 画像  -->
| item_name   | string | null: false |  <!-- 商品名 -->
| item_explanation | string | null: false |<!-- 商品説明 -->
| category | integer| null: false |<!-- カテゴリー -->
| item_status | integer | null: false |<!-- 商品の状態 -->
| shipping_charges | integer | null: false |<!-- 配送料の負担 -->
| shipping_region | integer | null: false |<!-- 配送料の地域 -->
| days_until_shipping | integer | null: false |<!-- 配送料の負担 -->
| price    | string | null: false |<!-- 価格 -->


### Association
- belongs_to :user
- has_one    :shop 
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
| prefecter      | integer | null: false|
| city           | string | null: false |
| house_number   | string | null: false |
| building_name  | string | null: false |
| Tell           | string | null: false |
| shop     | references | null: false,foreign_key: true |
### Association
- belongs_to  :shop