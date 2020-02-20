require 'rails_helper'

RSpec.describe Patron, type: :model do
  it "needs more than rewards lowest price" do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    reward = FactoryBot.create(:reward, product_id:product.id)
    patron = FactoryBot.build(:patron, donation:100, product_id:product.id, reward_id:reward.id, user_id:user.id)
    expect(patron).to_not be_valid
  end
end
