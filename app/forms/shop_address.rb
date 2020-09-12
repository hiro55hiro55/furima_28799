class ShopAddress 

include ActiveModel::Model
  attr_accessor :item_id,:user_id,:token, :postal_code, :city, :addresses, :phone_number, :buildings ,:address_prefecture_id
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :addresses
    validates :phone_number, format: {with:/\A\d{4,11}\z/ ,message: "ハイフンは不要で、5桁以上11桁以内で入力してください"}
    validates :address_prefecture_id, numericality: { other_than: 0 }
    validates :token
  end
  def save
    shop = Shop.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code, city: city, addresses: addresses, phone_number: phone_number, buildings: buildings ,address_prefecture_id: address_prefecture_id,shop_id:shop.id)
  end
end