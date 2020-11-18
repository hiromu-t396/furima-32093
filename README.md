# アプリケーション概要
___
## フリマアプリ


# アプリケーションの機能一覧
___
* 新規登録機能
* ログイン機能(devise)
* ログアウト機能
* 投稿機能(mini_magick)
* 投稿削除機能
* 投稿編集機能
* お気に入り機能
* 商品購入機能
* 商品へのコメント機能

# 使用技術
___
* HTML/CSS
* JavaScript
* ruby 2.6.5
* Rails 6.0.3.4

# テストフレームワーク
___
* Rspec

# 本番環境
___
* heroku

 




# furimaのER図
___

## users テーブル

| Column             | Type    | Options         |
|  --------          | ------  | -----------     |
| nickname           | string  | null: false     |
| email              | string  | null: false     |
| encrypted_password | string  | null: false     |
| firstname          | string  | null: false     |
| lastname           | string  | null: false     |
| firstname_kana     | string  | null: false     |  
| lastname_kana      | string  | null: false     | 
| birth_day          | date    | null: false     |


### Association

- has_many :items
- has_many :transactions


## items テーブル

| Column           | Type       | Options            |
| ------           | ------     | -----------        |
| item_name        | string     | null: false        |
| explanation      | text       | null: false        |
| category_id      | integer    | null: false        |
| condition_id     | integer    | null: false        |
| delivery_id      | integer    | null: false        |
| delivery_area_id | integer    | null: false        |
| delivery_days_id | integer    | null: false        |
| price            | integer    | null: false        |
| user             | references | foreign_key: true  |


### Association

- belongs_to :user
- has_one :transaction


# purchases テーブル

| Column           | Type        | Options            |
| ------           | ------      | -----------        |
| postal_code      | string      | null: false        |
| prefecture_id    | integer     | null: false        |
| municipality     | string      | null: false        |
| address          | string      | null: false        |
| building_name    | string      |                    |
| phone_number     | string      | null: false        |
| transaction      | references  | foreign_key: true  |


### Association

- has_one :transaction

# transaction

| Column      | Type        | Options            |
| ------      | ------      | -----------        |
| user        | references  | null: false        |
| item        | references  | null: false        |
| purchase    | references  | foreign_key: true  |



### Association

- belongs_to :user
- has_one :item
- has_one :purchase
