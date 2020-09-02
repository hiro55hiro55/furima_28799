require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品情報が保存できる'do 
    it"ログインしているユーザーだけが、出品ページへ遷移できること"do
    end
    it"画像は1枚必須であること(ActiveStorageを使用すること)"do
    end
    it"商品名が必須であること"do
    end
    it"カテゴリーの情報が必須であること"do
    end
    it"商品の状態についての情報が必須であること"do
    end
    it"配送料の負担についての情報が必須であること"do
    end
    it"発送元の地域についての情報が必須であること"do
    end
    it"発送までの日数についての情報が必須であること"do
    end
    it"価格についての情報が必須であること"do
    end
    it"価格の範囲が、¥300~¥9,999,999の間であること"do
    end
    it"入力された販売価格によって、非同期的に販売手数料や販売利益が変わること(JavaScriptを使用して実装すること)"do
    end
    t""do
    end
    t""do
    end
  end


end
