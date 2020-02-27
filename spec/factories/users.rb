FactoryBot.define do
  factory :user do
    name "shuma"
    password "121212"
    sequence(:email) { |n| "tester#{n}@example.com" }
  end
end
