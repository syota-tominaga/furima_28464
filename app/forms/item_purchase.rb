class ItemPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token

  POSTAL_REGEX = /\A\d{3}[-]\d{4}\z/
  PHONE_REGEX = /\A\d{10,11}\z/
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_REGEX }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone, format: { with: PHONE_REGEX }
  end
  def save
    Destination.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, item_id: item_id)
    Purchase.create!(item_id: item_id, user_id: user_id)
  end

end