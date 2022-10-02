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
- has_many :histories

## itemsテーブル
|column          |type      |options    |
|----------------| ---------| --------- |
|name            |string    |null: false|
|description     |text      |null: false|
|category_id     |integer   |null: false|
|status_id       |integer   |null: false|
|shipping_cost_id|integer   |null: false|
|prefecture_id   |integer   |null: false|
|shipping_day_id |integer   |null: false|
|price           |integer   |null: false|
|user            |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :history

## destinationsテーブル(配送先住所)
|column       |type      |options    |
|-------------| ---------| -------   |
|post_code    |string    |null: false|
|prefecture_id|integer   |null: false|
|city         |string    |null: false|
|address      |string    |null: false|
|building_name|string    |           |
|phone_number |string    |null: false|
|history      |references|null: false, foreign_key: true|

### Association
- belongs_to :history


## historiesテーブル(購入管理)
|column |type       |options   |
|-------| --------- | ------   |
|user   |references |null: false, foreign_key: true|
|item   |references |null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination