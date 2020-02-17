require 'rails_helper'

RSpec.describe Reward, type: :model do
  it "has only 3 rewards" do
    product = FactoryBot.create(:product)
    reward1 = product.rewards.create(title:"ccc",description:"aaaa", price:200)
    reward2 = product.rewards.create(title:"ccc",description:"aaaa", price:200)
    reward3 = product.rewards.create(title:"ccc",description:"aaaa", price:200)
    reward4 = product.rewards.build(title:"ccc",description:"aaaa", price:200)
    p reward4.valid?
    p reward4.errors
    expect(reward4.errors[:base]).to_not include("設定できるRewardは３つまでです")
  end
end
