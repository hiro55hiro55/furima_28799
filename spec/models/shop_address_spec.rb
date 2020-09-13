require 'rails_helper'
# bundle exec rspec spec/models/shop_address_spec.rb 

RSpec.describe ShopAddress, type: :model do
 describe '商品購入' do
   before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
      @user2 =  FactoryBot.create(:user)
      @shop_address = FactoryBot.build(:shop_address, user_id:@user2.id, item_id:@item.id)
   end
 
  context '商品が購入できる' do
    it"配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が存在している"do
       expect(@shop_address).to be_valid
    end
    it"建物名は空白でも購入ができる"do
       @shop_address.buildings = " "
       @shop_address.valid?
       expect(@shop_address).to be_valid
    end


  
  end
  context '商品が購入できない' do
    it"郵便番号が必須でハイフンがないと購入できない"do
     @shop_address.postal_code = "6222222"
     @shop_address.valid?
     expect(@shop_address.errors.full_messages).to include("Postal code 郵便番号は、3桁の数字ハイフン(ー）4桁の数字で記入してくださいis invalid. Include hyphen(-)")
    end
    it"郵便番号は３桁と４桁でないと購入できない"do
     @shop_address.postal_code = "6223-2222"
     @shop_address.valid?
     expect(@shop_address.errors.full_messages).to include("Postal code 郵便番号は、3桁の数字ハイフン(ー）4桁の数字で記入してくださいis invalid. Include hyphen(-)")
    end
    it"電話番号にはハイフンは不要で１１桁以内でないと購入できない"do
      @shop_address.phone_number = "444-444-4444"
      @shop_address.valid?
      expect(@shop_address.errors.full_messages).to include("Phone number ハイフンは不要で、5桁以上11桁以内で入力してください")
    end
    it"都道府県は必ず選択しないと購入できない"do
      @shop_address.address_prefecture_id = "0"
      @shop_address.valid?
      expect(@shop_address.errors.full_messages).to include("Address prefecture must be other than 0")
    end

    it"市区町村は必ず記入しないと購入できない"do
      @shop_address.city = ""
      @shop_address.valid?
      expect(@shop_address.errors.full_messages).to include("City can't be blank")
    end

    it"番地は必ず記入しないと購入できない"do
      @shop_address.addresses = ""
      @shop_address.valid?
      expect(@shop_address.errors.full_messages).to include("Addresses can't be blank")
    end
    
    it"tokenがないと購入ができない"do
      @shop_address.token = ""
      @shop_address.valid?
      expect(@shop_address.errors.full_messages).to include("Token can't be blank")
    end
  end


 end
end
