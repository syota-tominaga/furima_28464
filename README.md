# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| confirmation    | string  | null: false |
| family_name     | string  | null: false |
| first_name      | string  | null: false |
| family_name_kana| string  | null: false |
| first_name_kana | string  | null: false |
| birth_day       | date    | null: false |
### Association

- has_many :items
- has_many :destinations

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| text               | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| shipping_origin_id | integer    | null: false |
| delivery_fee_id    | integer    | null: false |
| delivery_day_id    | integer    | null: false | 
| price              | integer    | null: false |
| user_id        | references | null: false foreign_key:true |
### Association

- belongs_to             :users
- has_many               :purchasers
- has_one_attached       :image
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_origin
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :delivery_day

## destinations テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture_id| integer    | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
### Association

- belongs_to             :users
- belongs_to_active_hash :prefecture
- has_many               :purchasers

## purchasers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| destination_id | references | null: false, foreign_key: true |
### Association

- belongs_to :items
- belongs_to :destinations