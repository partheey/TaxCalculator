FactoryBot.define do
  factory :employee do
    sequence(:employee_id) { |n| "EMP#{n}" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_numbers { [Faker::PhoneNumber.subscriber_number(length: 10)] }
    doj { Faker::Date.backward(days: 365) }
    salary { Faker::Number.between(from: 20000, to: 200000) }
  end
end
