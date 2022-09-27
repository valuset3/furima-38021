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

## usersテーブル
|column            |type   |options   |
|------------------| ------| ------   |
|nickname          |string |null: false|
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false|
|family_name       |string |null: false|
|first_name        |string |null: false|
|family_name_kana  |string |null: false|
|first_name_kana   |string |null: false|
|birthday          |date   |null: false|

### Association
- has_many :items
- belongs_to :destinations
- has_many :comments

## itemsテーブル
|column       |type   |options   |
|-------------| ------| ------   |
|name         |string |null: false|
|description  |string |null: false|
|category_id  |integer|null: false|
|status       |string |null: false|
|shipping_cost|string |null: false|
|prefecture   |string |null: false|
|shipping_days|string |null: false|
|price        |integer|null: false|
|user_id      |integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments

## destinationsテーブル
|column       |type   |options   |
|-------------| ------| ------   |
|post_code    |string |null: false|
|city         |string |null: false|
|address      |string |null: false|
|building_name|string |           |
|phone_number |string |null: false|
|user_id      |integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## commentsテーブル
|column       |type      |options   |
|-------------| ---------| -------  |
|content      |string    |null: false|
|user_id      |references|null: false, foreign_key: true|
|item_id      |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## historiesテーブル
|column       |type   |options   |
|-------------| ------| ------   |
|user_id      |integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :destinations