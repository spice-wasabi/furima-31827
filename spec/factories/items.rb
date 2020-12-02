FactoryBot.define do
  factory :item do
    item_name         {"テストtest987"}
    item_info         {"テストtest987"}
    category_id       {"1"}
    status_id         {"1"}
    delivery_fee_id   {"1"}
    city_id           {"1"}
    days_to_ship_id   {"1"}
    price             {"10000"}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
