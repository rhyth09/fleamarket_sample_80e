FactoryBot.define do
  
  factory :user do
    nickname              {"sample name"}
    email                 {"sample@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_year            {"0000"}
    birth_month           {"00"}
    birth_day             {"00"}
  end
end