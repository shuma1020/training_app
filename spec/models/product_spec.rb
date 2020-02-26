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

  it "must have a patron at least" do
    expect(Product.donated_all).to be_empty
  end

  it "have patrons" do #donated_all
    product = FactoryBot.create(:product)
    reward = FactoryBot.create(:reward, product:product)
    patron = FactoryBot.create(:patron, product:product, reward:reward)
    expect(Product.donated_all).to_not be_empty
  end
end
