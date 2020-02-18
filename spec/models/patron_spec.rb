require 'rails_helper'

RSpec.describe Patron, type: :model do
  it "needs more than rewards lowest price" do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    reward = FactoryBot.create(:reward, product_id:product.id)
    patron = FactoryBot.build(:patron, donation:100, product_id:product.id, reward_id:reward.id, user_id:user.id)
    patron.valid?
    expect(patron.errors[:base]).to include("最低金額に達していません")
  end
end
