class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def index
    return redirect_to root_path if current_user.id == @item.user_id || @item.shop != nil 

        @shop = ShopAddress.new

  end

  def create
    @shop = ShopAddress.new(shop_address_params)

    if @shop.valid?
      pay_item
      @shop.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def shop_address_params
    params.permit(:item_id,:token, :postal_code, :city, :addresses, :phone_number, :buildings ,:address_prefecture_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.item_price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
 end
  
end