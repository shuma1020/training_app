require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has a factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "needs title" do
    product = FactoryBot.build(:product, title:nil)
    product.valid?
    expect(product.errors[:title]).to include("を入力してください")
  end

  it "needs rewards when its status is release" do
    product = FactoryBot.create(:product, status:"draft")
    product.update(status: "release")
    expect(product.errors[:base]).to include("Rewardを入れてください")
  end
end
