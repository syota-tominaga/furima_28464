FactoryBot.define do
  factory :item_purchase do
    postal_code { "000-0000" }
    prefecture_id { 1 }
    city { "熊谷市" }
    address { "新堀1-1" }
    building { "レオパレス" }
    phone { "00000000000" }
    user_id { 1 }
    item_id { 1 }
  end
end
