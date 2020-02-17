require 'rails_helper'

RSpec.describe Reward, type: :model do
  it "has a limit which allows only three " do
    product = FactoryBot.create(:product)
    reward1 = product.rewards.create(title:"ccc",description:"aaaa", price:200)
    reward2 = product.rewards.create(title:"ccc",description:"aaaa", price:200)
    reward3 = product.rewards.create(title:"ccc",description:"aaaa", price:200)
    reward4 = product.rewards.build(title:"ccc",description:"aaaa", price:200)
    reward4.valid?
    expect(reward4.errors[:base]).to include("設定できるRewardは３つまでです")
  end
end