FactoryBot.define do
  factory :reward do
    association :product
    title "お職事件"
    description "一緒に中華食べましょう"
    price 200
  end
end