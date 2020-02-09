require 'rails_helper'

RSpec.describe User, type: :model do
  # 姓、名、メール、パスワードがあれば有効な状態であること
  it "is valid with a first name, last name, email, and password" do
    user = User.new(
      name: "Aaron",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    expect(user).to be_valid
  end
  # 名がなければ無効な状態であること
  it "is invalid without a  name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    User.create(
      name: "shuma",
      email:"aaa@gmail.com",
      password:"121212"
    )
    user = User.new(name: "maya",
    email:"aaa@gmail.com",
    password:"121212"
    )
    user.valid?
    expect(user.errors[:name]).to include("has already been taken")
  end
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address"
  # ユーザーのフルネームを文字列として返すこと
  it "returns a user's full name as a string"
end
