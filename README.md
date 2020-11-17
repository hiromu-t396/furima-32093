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

| Column         | Type   | Options         |
|  --------      | ------ | -----------     |
| nickname       | string | null: false     |
| email          | string | null: false     |
| password       | string | null: false     |
| firstname      | string | null: false     |
| lastname       | string | null: false     |
| firstname_kana | string | null: false     |  
| lastname_kana  | string | null: false     | 
| birth_year     | string | null: false     |
| birth_month    | string | null: false     |
| birth_day      | string | null: false     |


### Association

- has_many :items
- has_many :comments

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
| price         | string     | null: false        |
| user          | references | foreign_key: true  |


### Association

- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| text      | text       | null: false, foreign_key: true |
| user      | references | foreign_key: true              |
| prototype | references | foreign_key: true              |

