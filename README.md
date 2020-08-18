# テーブル設計

## users テーブル

| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| name         | string   | null: false |
| email        | string   | null: false |
| password     | string   | null: false |
| confirmation | string   | null: false |
| family_name  | string   | null: false |
| first_name   | string   | null: false |
| family       | string   | null: false |
| first        | string   | null: false |
| birth_day    | datetime | null: false |

### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| name            | string     | null: false |
| image           | string     | null: false |
| text            | text       | null: false |
| category        | string     | null: false |
| condition       | string     | null: false |
| shipping_origin | string     | null: false |
| delivery_fee    | integer    | null: false |
| delivery_day    | datetime   | null: false | 
| price           | integer    | null: false |
| user_id        | references | null: false foreign_key:true |
### Association

- belongs_to :users
- has_many   :purchasers
- has_many   :sales

## purchasers テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| phone       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |
### Association

- belongs_to :users
- has_many   :sales

## sales テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| sold    | string     | null: false |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |
### Association

- belongs_to :items
- belongs_to :users