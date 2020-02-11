require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has a factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "has rewards when you manage it as realese" do
    product = FactoryBot.create(:product)
    product.valid?
    expect(product.errors[:title]).to include("バリデーションに失敗しました: タイトルを入力してください")
  end
end
