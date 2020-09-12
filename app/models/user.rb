class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :items
        has_many :shops
        
        with_options presence: true do
          validates :email
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6}+\z/i, message: "は半角英数６文字以上で入力してください。"}
          validates :birth_date

          validates :first_name, format: { with: /\A[一-龥]+\z/, message: "は漢字で入力してください。"}
          validates :last_name, format: { with: /\A[一-龥]+\z/, message: "は漢字で入力してください。"}
          validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください。"}
          validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力してください。"}
          validates :nickname, format: { with: /\A[a-zA-Z0-9ぁ-んァ-ン一-龥]+\z/, message: "は半角英数と全角ひらがな、全角カタカナ、漢字で入力してください。"}

        end
  end
