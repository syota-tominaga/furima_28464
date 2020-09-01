class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_day
  has_one_attached :image
  has_one :destination
  has_one :purchase

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :delivery_fee_id
    validates :delivery_day_id
    validates :price
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
