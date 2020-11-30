class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
  end


  def create
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to items_path
    else
      render action: :index
    end
  end

  private

  def item
    item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:item_purchase).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 秘密鍵のコード(環境変数)
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
