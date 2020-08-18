# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| name            | string     | null: false |
| image           |            | null: false |
| text            | text       | null: false |
| category        |            | null: false |
| condition       | string     | null: false |
| shipping_origin | string     | null: false |
| delivery_fee    | integer    | null: false |
| delivery_day    | datetime   | null: false | 
| price           | integer    | null: false |
| user_id         | references |             |
### Association

- belongs_to :users
- has_many   :purchasers
- has_many   :sales

## purchasers テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| postal_code | string     | null: false |
| prefectures | string     | null: false |
| city        | string     | null: false |
| address     | string     | null: false |
| building    | string     |             |
| phone       | integer    | null: false |
| item_id     | references |             |
| user_id     | references |             |
### Association

- belongs_to :users
- belongs_to :item
- has_many   :sales

## sales テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| sold          | string | null: false |
| sell          | string | null: false |
| item_id       | string | null: false |
| purchasers_id |        |             |
### Association

- belongs_to :items
- belongs_to :purchasers