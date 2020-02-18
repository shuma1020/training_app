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

  it "allow only user who are not to like " do
  end
end
