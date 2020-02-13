require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid name and email, and password" do
    user= User.new(name:"shuma",
      email:"aaa@gmail.com",
      password: "121212",)
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = FactoryBot.build(:user, name:nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "is invalid without an email address" do
    user = User.new(email:nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end


end
