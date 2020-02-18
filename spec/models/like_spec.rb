require 'rails_helper'

RSpec.describe Like, type: :model do

  it "user can like product which are not yours" do
    user = FactoryBot.build(:user)
    product = FactoryBot.build(:product, user:user)
    like = FactoryBot.build(:like, user:user, product:product)
    like.valid?
    expect(like.errors[:base]).to include("いいねはできません！")
  end
end
