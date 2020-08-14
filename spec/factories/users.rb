FactoryBot.define do
  
  factory :user do
    nickname              {"sample name"}
    email                 {"sample@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"鈴木"}
    first_name            {"太郎"}
    last_name_kana        {"スズキ"}
    first_name_kana       {"タロウ"}
    birth_year            {"0000"}
    birth_month           {"00"}
    birth_day             {"00"}
  end
end