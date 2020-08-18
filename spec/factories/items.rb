FactoryBot.define do
  factory :item do
    name             {"sample name"}
    price            {5000}
    explain          {"sample explanation"}

    prefecture_id    {1}
    shipping_date_id {1}
    item_status_id   {2}
    postage_id       {2}
    category
    after(:build) do |item|
      item.images << build(:image, item: item)
    end
  end
end