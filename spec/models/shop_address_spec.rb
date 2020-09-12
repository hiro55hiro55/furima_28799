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


  
  end
  describe '商品が購入できない' do
    it"郵便番号が必須でハイフンがないと購入できない"do
     @shop_address.postal_code = "6222222"
     @shop_address.valid?
    expect(@shop_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
    it"電話番号にはハイフンは不要で１１桁以内でないと購入できない"do

      @shop_address.phone_number = "444-444-4444"
      @shop_address.valid?
    expect(@shop_address.errors.full_messages).to include("Phone number ハイフンは不要で、5桁以上11桁以内で入力してください")
    end
    it"都道府県は必ず選択しないと購入できない"do

    @shop_address.address_prefecture_id = ""
      @shop_address.valid?
    expect(@shop_address.errors.full_messages).to include("Address prefecture can't be blank", "Address prefecture is not a number")
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
    
  end


  end
end
