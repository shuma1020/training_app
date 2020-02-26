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
    products =  Product.joins(:patrons).group(:product_id).select('count(donation) as patron_count').order('patron_count desc')
    expect(products).to be_empty
  end

  it "arrrange patrons desc" do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    reward = FactoryBot.create(:reward, product:product)
    patron = FactoryBot.create(:patron, product:product,user:user, reward:reward)
    products =  Product.joins(:patrons).group(:product_id).select('count(donation) as patron_count').order('patron_count desc')
    products.each do |product|
      expect(product[:patron_count]).to be 1
    end
  end
end
