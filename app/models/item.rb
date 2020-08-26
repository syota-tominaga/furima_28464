class Item < ApplicationRecord

  belings_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_day

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :category_id
    validates :condition_id
    validates :shipping_origin_id
    validates :delivery_fee_id
    validates :delivery_day_id
end
