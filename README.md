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

| Column         | Type    | Options         |
|  --------      | ------  | -----------     |
| nickname       | string  | null: false     |
| email          | string  | null: false     |
| password       | string  | null: false     |
| firstname      | string  | null: false     |
| lastname       | string  | null: false     |
| firstname_kana | string  | null: false     |  
| lastname_kana  | string  | null: false     | 
| birth_year     | integer | null: false     |
| birth_month    | integer | null: false     |
| birth_day      | integer | null: false     |


### Association

- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル

| Column        | Type       | Options            |
| ------        | ------     | -----------        |
| item_name     | string     | null: false        |
| explanation   | text       | null: false        |
| category      | string     | null: false        |
| condition     | string     | null: false        |
| delivery      | string     | null: false        |
| delivery_area | string     | null: false        |
| delivery_days | string     | null: false        |
| price         | integer    | null: false        |
| user_id       | references | foreign_key: true  |


### Association

# purchases テーブル

| Column           | Type        | Options            |
| ------           | ------      | -----------        |
| card_infomation  | integer     | null: false        |
| expiration_month | integer     | null: false        |
| expiration_year  | integer     | null: false        |
| security_code    | integer     | null: false        |
| postal_code      | integer     | null: false        |
| prefectures      | string      | null: false        |
| municipality     | string      | null: false        |
| address          | string      | null: false        |
| building_name    | string      | null: false        |
| phone_number     | integer     | null: false        |
| user_id          | references  | foreign_key: true  |
