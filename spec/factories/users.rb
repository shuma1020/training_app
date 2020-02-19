FactoryBot.define do
  factory :user do
    name "shuma"
    sequence(:email) { |n| "tester#{n}@example.com" }
    password "121212"
  end
end
