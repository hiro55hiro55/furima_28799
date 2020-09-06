class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category 
  belongs_to_active_hash :item_sales_status
  belongs_to_active_hash :item_shipping_fee_status
  belongs_to_active_hash :item_prefecture
  belongs_to_active_hash :item_scheduled_delivery
  has_one_attached :item_image

  belongs_to :user
  has_one    :shop
  
  with_options presence: true do


  validates :item_image

  validates :item_info

  validates :item_name


  
  validates :item_price, numericality: { with: /\A[0-9]+\z/, message: "は半角数値で入力してください。"}


  validates_inclusion_of :item_price,  {in:300..9_999_999, message: "価格は¥300〜¥9,999,999の間で入力してください。"}

  validates :item_category_id, :item_sales_status_id,:item_shipping_fee_status_id,:item_scheduled_delivery_id,numericality: { other_than: 1 } 

  validates :item_prefecture_id,numericality: { other_than: 0 }
  end


end


