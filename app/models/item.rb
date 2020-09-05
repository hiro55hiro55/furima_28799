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
  validates :item_name, presence: true
  with_options presence: true do

  # validates :content, presence: true, unless: :was_attached?

  validates :item_image

  validates :item_name,format: { with: /\A[a-zA-Z0-9ぁ-んァ-ン一-龥]+\z/, message: "は半角英数と全角ひらがな、全角カタカナ、漢字で入力してください。"}

  validates :item_info,format: { with: /\A[a-zA-Z0-9ぁ-んァ-ン一-龥]+\z/, message: "は半角英数と全角ひらがな、全角カタカナ、漢字で入力してください。"}

  


  validates :item_price, format: { with: /\A[0-9]+\z/, message: "は半角数値で入力してください。"}
  validates_inclusion_of :item_price,  {in:300..9_999_999, message: "価格は¥300〜¥9,999,999の間で入力してください。"}
  
  # プルダウンのバリデーション
  validates :item_category_id, :item_sales_status_id,:item_shipping_fee_status_id,:item_prefecture_id,:item_scheduled_delivery_id,numericality: { other_than: 0 } 
  end
  # def was_attached?
  #   self.item_image.attached?
  # end

end


