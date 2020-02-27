require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid name and email, and password" do
    user= FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = FactoryBot.build(:user, name:nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid without an email address" do
    user = FactoryBot.build(:user,email:nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "can not like own product" do
    user = FactoryBot.build(:user)
    product = FactoryBot.build(:product, user:user)
    expect(user.liked_for?(product)).to be_falsey
  end

  it "can not like product which has already been liked" do
    user = FactoryBot.build(:user)
    product = FactoryBot.build(:product)
    FactoryBot.create(:like, product:product, user:user)
    expect(user.liked_for?(product)).to be_falsey
  end

  it "can not like nil" do
    user = FactoryBot.build(:user)
    expect(user.liked_for?(nil)).to be_falsey
  end
end
