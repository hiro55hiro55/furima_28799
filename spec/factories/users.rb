FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              { 'abc1234' } 
    password_confirmation {password}
    birth_date            {19300204}
    first_name            {"古川"}
    last_name             {"広泰"}
    first_name_kana       {"フルカワ"}
    last_name_kana        {"ヒロヤス"}
  end
end