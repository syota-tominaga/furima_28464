class ItemPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code
    #validates :prefecture_id
    validates :city
    validates :address
    validates :phone
  end
  def save
    Destination.create!(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, item_id: item_id)
    Purchase.create!(item_id: item_id, user_id: user_id)
  end

end