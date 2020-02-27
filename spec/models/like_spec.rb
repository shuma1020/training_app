require 'rails_helper'

RSpec.describe Like, type: :model do
  it "is not allowed without user" do
    product = FactoryBot.create(:product)
    like = FactoryBot.build(:like, user:nil, product:product)
    expect(like).to_not be_valid
  end

  it " is not allowed when user is not permitted to like" do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    like = FactoryBot.create(:like, user:user, product:product)
    expect(like).to_not be_valid
  end
end
