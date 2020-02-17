FactoryBot.define do
  factory :patron do
    association :user
    association :product
    association :reward
    donation 200
  end
end
