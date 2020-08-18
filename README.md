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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| image           |        | null: false |
| text            |        |             |
| category        |
| condition       |
| shipping_origin |
| delivery_fee    |
| delivery_fee    |
| price           |
| user_id         |
### Association

- belongs_to :users
- has_many   :purchasers
- has_many   :sales

## purchasers テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| postal_code | string | null: false |
| prefectures |        | null: false |
| city        |        |             |
| address     |
| building    |
| phone       |
| item_id     |
| user_id     |
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
| purchasers_id |
### Association

- belongs_to :items
- belongs_to :purchasers