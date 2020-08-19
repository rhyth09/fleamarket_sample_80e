FactoryBot.define do
  
  factory :address do
    send_last_name             {"鈴木"}
    send_first_name            {"太郎"}
    send_last_name_kana        {"スズキ"}
    send_first_name_kana       {"タロウ"}
    postal_code                {1234567}
    prefecture_id              {1}
    city                       {"横浜市緑区"}
    address                    {"青山1-1-1"}
  end
end