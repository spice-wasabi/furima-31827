FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"000aaa"}
    password_confirmation {password}
    last_name             {"朝日"}
    first_name            {"太郎"}
    last_name_kana        {"アサヒ"}
    first_name_kana       {"タロウ"}
    birthday              {"19990101"}
  end
end