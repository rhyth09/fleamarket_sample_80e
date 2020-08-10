FactoryBot.define do
  factory :item do
    name             {"sample name"}
    price            {5000}
    explain          {"sample explanation"}
    size             {"sample size"}
    brand            {"sample brand"}
    category
    prefecture_id    {1}
    shipping_date_id {1}
    item_status_id   {2}
    postage_id       {2}
  end
end