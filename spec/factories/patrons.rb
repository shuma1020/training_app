FactoryBot.define do
  factory :patron do
    user
    product
    reward
    donation {200}
  end
end
