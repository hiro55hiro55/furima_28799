class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category 
  belongs_to_active_hash :item_sales_status
  belongs_to_active_hash :item_shipping_fee_status
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_scheduled_delivery
  has_one_attached :item_image


  validates :item_image, :item_name,:item_info,:item_category_id, :item_sales_status_id,:item_shipping_fee_status_id,:item_prefecture_id,:item_scheduled_delivery_id,:item_price, presence: true

  validates :item_category_id, :item_sales_status_id,:item_shipping_fee_status_id,:item_prefecture_id,:item_scheduled_delivery_id,numericality: { other_than: 0 } 


end
