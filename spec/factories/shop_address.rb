FactoryBot.define do
  factory :shop_address do
     postal_code                   {"652-0002"}
     city                          {"神戸市中央区"}
     addresses                     {"3-1-17番地"}
     address_prefecture_id         {2}
     phone_number                  {"09085222189"}
     buildings                     {"北野ハウス"}
     token                         {"sample"}
     association :item
     association :user
  end
end
