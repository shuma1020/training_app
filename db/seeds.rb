# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(id: 1, email: "ssss@gmail.com", password: "ssssss", name: "shuma")
User.create!(id: 2, email: "gggg@gmail.com", password: "gggggg", name: "gggg")
Product.create!(title: "aaa", price:100, description: "33333", message: "gggg", user_id: 1)
Product.create!(title: "ssss", price:200, description: "3asad3", message: "gaaaa", user_id: 1)
Product.create!(title: "eee", price:100, description: "eeee", message: "eeee", user_id: 2)
Product.create!(title: "eee", price:100, description: "eeee", status: "draft",  message: "eeee", user_id: 2)
Product.create!(title: "eee", price:100, description: "eeee", status: "release",  message: "eeee", user_id: 2)
Product.create!(title: "eee", price:100, description: "eeee", status: "draft",  message: "eeee", user_id: 2)
Reward.create!(title: "aaa", price: 100, description: "3333", product_id: 1)
Reward.create!(title: "asdfassf", price: 100, description: "3333", product_id: 1)
Reward.create!(title: "dddddd", price: 100, description: "3333", product_id: 1)
Reward.create!(title: "aaa", price: 100, description: "3333", product_id: 5)
Reward.create!(title: "asdfassf", price: 100, description: "3333", product_id: 6)
Reward.create!(title: "dddddd", price: 100, description: "3333", product_id: 6)
Reward.create!(title: "iwiwiwi", price: 100, description: "3333", product_id: 6)