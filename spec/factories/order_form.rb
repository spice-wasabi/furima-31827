FactoryBot.define do
  factory :order_form do
    postal_code        {"180-1800"}
    city_id            {5}
    town               {"青森市"}
    address            {"青森町５−５−５"}
    phone_num          {"09055558888"}
    user_id            {1}
    item_id            {1}
    token              {"tok_abcdefghijk00000000000000000"}
  end
end