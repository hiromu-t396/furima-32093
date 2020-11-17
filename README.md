# アプリケーション概要
___
## フリマアプリ


# アプリケーションの機能一覧
＿＿＿
* ログイン関連

 * ログイン機能
 * ログアウト機能

* ユーザー関連

 * ユーザ登録機能

* 投稿関連

 * 投稿機能
 * 投稿削除機能
 * 投稿編集機能
 * お気に入り機能
 * 商品不適切報告機能

* 商品購入関連
 * 商品購入機能


 




# furimaのER図
___

## users テーブル

| Column     | Type   | Options         |
|  --------  | ------ | -----------     |
| nickname   | string | null: false     |
| email      | string | null: false     |
| password   | string | null: false     |
| lastname   | string   | null: false     |
| firstname  | string   | null: false     |
| birth   | text   | null: false     |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column     | Type       | Options            |
| ------     | ------     | -----------        |
| title      | string     | null: false        |
| catch_copy | text       | null: false        |
| concept    | text       | null: false        |
| user       | references | foreign_key: true  |


### Association

- has_many :comments

## comments テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| text      | text       | null: false, foreign_key: true |
| user      | references | foreign_key: true              |
| prototype | references | foreign_key: true              |

