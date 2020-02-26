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
    product_1 = FactoryBot.create(:product, price:300)
    product_2 = FactoryBot.create(:product, price: 400)
    reward_1 = FactoryBot.create(:reward, product:product_1)
    reward_2 = FactoryBot.create(:reward, product:product_2)
    patron = FactoryBot.create(:patron, product:product_1, reward:reward_1)
    patron = FactoryBot.create(:patron, product:product_2, reward:reward_2)
    patron = FactoryBot.create(:patron, product:product_2, reward:reward_2)
    expect(Product.donated_all).to_not include product
    expect(Product.donated_all).to include product_1
  end
end
