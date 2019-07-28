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
## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|comment_id|references|null: false, foreign_key: true|
|image|text|null: false|
|product_name|string|null: false|      　<!-- 　商品名 -->
|category|string|null: false|
|brand|string|null: false|　　　　　　  　<!-- 　ブランチ名 -->
|product_status|string|null: false|　　　<!--商品の状態 -->
|shipping_charges|string|null: false|　　<!--配送料の負担-->
|shipping_day|integer|null: false|　　　　<!--発送までの日数-->
|region|string|null: false|　　　　　　　　　<!--発送元の地域-->
|day_to_ship|integer|null: false|　　　　　<!--発送までの日数-->
|price|integer|null: false|


### Association

* belongs_to :users
* has_many :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|comment|text||

### Association

* belongs_to :users
* belongs_to :items

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|comment_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|encrypted_password|varchar||
|reset_password_token|varchar||
|reset_password_sent_at|datetime||
|remember_created_at|datetime||
|created_at|datetime||
|updated_at|datetime||
|nickname|varchar||
|wallet|integer||

### Association

* has_many :comments
* has_many :items