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
| birth_year_id   | date    | null: false |
| birth_month_id  | date    | null: false |
| birth_day_id    | date    | null: false |
### Association

- has_many               :items
- has_many               :purchasers
- has_many               :destinations
- belongs_to_active_hash :birth_year
- belongs_to_active_hash :birth_month
- belongs_to_active_hash ::birth_day

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| text               | text       | null: false |
| category_id        | string     | null: false |
| condition_id       | string     | null: false |
| shipping_origin_id | string     | null: false |
| delivery_fee_id    | integer    | null: false |
| delivery_day_id    | datetime   | null: false | 
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
| prefecture_id| string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
### Association

- belongs_to             :users
- belongs_to_active_hash :prefecture

## purchasers テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |
### Association

- belongs_to :items
- belongs_to :users