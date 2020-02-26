FactoryBot.define do
  factory :patron do
    user
    product
    reward
    donation {4000}
  end
end
