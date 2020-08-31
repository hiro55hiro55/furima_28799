
# bundle exec rspec spec/models/user_spec.rb 

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録がうまくいくとき'do
      it "nicknameとemail、passwordとpassword＿confirmation、姓と名、姓(カタカナ）名(カタカナ）が存在すれば登録できる" do      
      expect(@user).to be_valid
      end
  
      it "passwordが６文字以上半角英数であれば登録できる" do
        @user.nickname = "aaa1234"
        expect(@user).to be_valid
      end
      it"ユーザー本名が、名字と名前がそれぞれ必須であること"do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank", "First name は漢字で入力してください。")
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name は漢字で入力してください。")
      end
      it"ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること"do
        @user.first_name = "ad"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は漢字で入力してください。")
        @user.last_name = "sd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は漢字で入力してください。")
      end
      it"ユーザー本名のフリガナは全角（カタカナ）で入力させること"do
        @user.first_name_kana = "de"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角カタカナで入力してください。")
        @user.last_name_kana = "sd"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana は全角カタカナで入力してください。")
      end
      it"生年月日が必須であること"do
         @user.birth_date = ""
         @user.valid?
         expect(@user.errors.full_messages).to include("Birth date can't be blank", "Birth date は半角数値で入力してください。")

      end




      
    end
    context '新規登録がうまくいかないとき'do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank", "Nickname は半角英数と全角ひらがな、全角カタカナ、漢字で入力してください。")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank", "Email can't be blank", "Email は半角英数と記号で入力してください。")
      end
      it "emailが一意性でないと登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
         expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは＠を含まないと登録できない" do
          @user.email = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email は半角英数と記号で入力してください。")

      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", "Password は半角英数で入力してください。")
      end
      it "passwordは５文字以下だと登録できない" do
        @user.password = 'aaa22'
        @user.password_confirmation = 'aaa22'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数字混合でないと登録できない" do
        @user.password = '555555'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordは確認用を含めて２回入力しないと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
    end
   end
end