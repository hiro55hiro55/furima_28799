# bundle exec rspec spec/models/item_spec.rb

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品情報が保存できる'do 
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
      @item.item_image = fixture_file_upload("test.jpeg")
      
    end
    context '出品情報がうまく保存できる時'do

       it"商品名、カテゴリーの情報、商品の状態、配送料の負担、発送元の地域、発送日までの日数、価格が存在している事"do
          expect(@item).to be_valid
       end
       it"画像は1枚必須であること(ActiveStorageを使用すること)"do
          expect(@item.item_image).to be_valid
       end
       it"商品名が必須であること"do

          @item.item_name = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank", "Item name は半角英数と全角ひらがな、全角カタカナ、漢字で入力してください。")
       end
      it"カテゴリーの情報が必須であること"do
         @item.item_category_id = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Item category can't be blank", "Item category is not a number")
       end
       it"商品の状態についての情報が必須であること"do
       
         @item.item_sales_status_id = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Item sales status can't be blank", "Item sales status is not a number")
      end
       it"配送料の負担についての情報が必須であること"do
         @item.item_shipping_fee_status_id = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank", "Item shipping fee status is not a number")
       end
       it"発送元の地域についての情報が必須であること"do
         @item.item_prefecture_id = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Item prefecture can't be blank", "Item prefecture is not a number")
       end
       it"発送までの日数についての情報が必須であること"do
         @item.item_scheduled_delivery_id = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank", "Item scheduled delivery is not a number")       end
       it"価格についての情報が必須であること"do
         @item.item_price = ""
         @item.valid?
         expect(@item.errors.full_messages).to include("Item price can't be blank", "Item price は半角数値で入力してください。") 
       end
       it"価格の範囲が、¥300~¥9,999,999の間であること"do
         @item.item_price = 1
         @item.valid?
         expect(@item.errors.full_messages).to include("Item price 価格は¥300〜¥9,999,999の間で入力してください。") 
       end
       
   end
  end
end

