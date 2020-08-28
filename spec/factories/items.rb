FactoryBot.define do
  factory :item do
    name { 'a' }
    text { 'a' }
    category_id { 3 }
    condition_id { 5 }
    delivery_fee_id { 2 }
    shipping_origin_id { 4 }
    delivery_day_id { 1 }
    price { 300 }
    association :user
  end
end
