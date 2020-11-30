require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase = FactoryBot.build(:item_purchase)
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it '全ての値が適切に記入されている' do
        expect(@item_purchase).to be_valid
      end
      it '建物名が空でも登録できる' do
        @item_purchase.building_name = nil
        expect(@item_purchase).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空のとき' do
        @item_purchase.postal_code = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが含まれていないとき' do
        @item_purchase.postal_code = '1111111'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Postal code Input correctly')
      end
      it '都道府県が選択されていないとき' do
        @item_purchase.prefecture_id = 1
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が空の時' do
        @item_purchase.municipality = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空のとき' do
        @item_purchase.address = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空のとき' do
        @item_purchase.phone_number = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が半角数字以外のとき' do
        @item_purchase.phone_number = '１１１１１１１１１１１'
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include('Phone number Input only number')
      end
      it '電話番号が12桁以上だと購入できない' do
        @item_purchase.phone_number = '111111111111'
        @item_purchase.valid?
      end
      it 'カード情報が空では購入できない' do
        @item_purchase.token = nil
        @item_purchase.valid?
        expect(@item_purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では購入できない' do
        @item_purchase.user_id = nil
        @item_purchase.valid?
      end
      it 'item_idが空では購入できない' do
        @item_purchase.user_id = nil
        @item_purchase.valid?
      end
    end
  end
end
