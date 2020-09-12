FactoryBot.define do
  factory :shop do
    association :user
    association :item
  end
end
