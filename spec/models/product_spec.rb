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

  it "arrange patrons desc when it has no patron" do
    products =  Product.ranked_patron_count
    expect(products).to be_empty
  end

  it "arrrange patrons desc" do #
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    product_1 = FactoryBot.create(:product, price:300)
    reward = FactoryBot.create(:reward, product:product)
    reward_1 = FactoryBot.create(:reward, product:product_1)
    patron = FactoryBot.create(:patron, product:product,user:user, reward:reward)
    patron = FactoryBot.create(:patron, product:product,user:user, reward:reward, donation:1000)
    patron = FactoryBot.create(:patron, product:product_1, reward:reward,donation:2000)
    products = Product.ranked_patron_count
    expect(products.first[:patron_count]).to be 2
    expect(products.second[:patron_count]).to be 1
  end
end
