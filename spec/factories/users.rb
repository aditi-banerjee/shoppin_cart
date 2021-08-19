FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    delivery_address { Faker::Lorem.paragraph }
    password { Faker::Internet.password }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
