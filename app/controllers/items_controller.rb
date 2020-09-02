class ItemsController < ApplicationController 
      
  def new
     @Item = Item.new
  end

  def index
      @items = Item.all.order("created_at DESC")
  end

  def create
      items = Item.create!(item_params)
      redirect_to "/items/#{items.id}"
  end

  private
  def item_params
    params.require(:item).permit(:item_image,:item_name,:item_info,:item_category_id, :item_sales_status_id,:item_shipping_fee_status_id,:item_prefecture_id,:item_scheduled_delivery_id,:item_price)
  end

  #  def item_params
  #      params.require(:item).permit(:content, :item_image)
  #    end
end
