require 'rails_helper'

RSpec.describe ItemPurchase, type: :model do
  before do
    @item_purchase =FactoryBot.build(:item_purchase)
  end

  describe '購入機能' do
    context '購入がうまくいくとき' do
      it '全ての値が適切に記入されている' do
          expect(@item_purchase).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it '郵便番号が空のとき' do
        
      end
      it '郵便番号にハイフンが含まれていないとき' do

      end
      it '都道府県が選択されていないとき' do

      end
      it '市区町村が空の時' do

      end
      it '番地が空のとき' do

      end
      it '電話番号が空のとき' do

      end
      it '電話番号が半角数字以外のとき' do

      end
      it '電話番号が12桁以上のとき' do
        
      end

    end
  end
end

    