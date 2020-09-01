require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe '商品購入機能' do
    context '商品購入ができる時' do
      it '全ての欄が入力できている' do
        expect(@item_purchase).to be_valid
      end
      it '郵便番号にハイフンがついている' do
        @item_purchase.postal_code = "222-2222"
        expect(@item_purchase).to be_valid
      end
      it "電話番号にハイフン入らない" do
        @item_purchase.phone = "11111111111"
        expect(@item_purchase).to be_valid
      end
    end
    context '商品が購入できない時' do
      it '郵便番号が空である' do
        @item_purchase.postal_code = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがない' do
        @item_purchase.postal_code = '2222222'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が空である' do
        @item_purchase.prefecture_id = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村が空である' do
        @item_purchase.city = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空である' do
        @item_purchase.address = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空である' do
        @item_purchase.phone = ''
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号にハイフンがある' do
        @item_purchase.phone = "111-1111-1111"
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone is invalid")
      end
    end
  end

end