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
| name     | string | null: false |
| name_reading | string | null: false |
| nikname  | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| password_confirmation | string | '': false |
| birthday | string | null: false |

### Association

- has_many :item
- has_many :shop
- has_one  :address ,through: :shop

## item テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| image    | references | null: false |
| text     | string | null: false |
| price    | string | null: false |

### Association
- has_one  :shop 
- belongs_to :user

## shopテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| user     | references | null: false,foreign_key: true |
| item     | references | null: false,foreign_key: true |
### Association
- belongs_to  :item 
- belongs_to :user

## addressテーブル
| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| postal_code    | string | null: false |
| prefecter      | string | null: false |
| city           | string | null: false |
| house_number   | string | null: false |
| building_name  | string | null: false |
| Tell           | string | null: false |

### Association
- belongs_to  :shop