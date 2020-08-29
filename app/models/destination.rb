class Destination < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :item
  belongs_to :user
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone
  end
end
