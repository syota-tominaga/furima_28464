class Item < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :category_id
  belongs_to_active_hash :condition_id
  belongs_to_active_hash :shipping_origin_id
  belongs_to_active_hash :delivery_fee_id
  belongs_to_active_hash :delivery_day_id

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :category_id
    validates :condition_id
    validates :shipping_origin_id
    validates :delivery_fee_id
    validates :delivery_day_id
    validates :price
  end
end
