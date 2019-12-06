# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(id: 1, email: "ssss@gmail.com", password: "ssssss", name: "shuma")
user2 = User.create!(id: 2, email: "gggg@gmail.com", password: "gggggg", name: "gggg")
pro1 = user1.products.create!(title: "aaa", price:100, description: "33333", message: "gggg")
pro2 = user2.products.create!(title: "ssss", price:200, description: "3asad3", message: "gaaaa")
reward1 = pro1.rewards.create!(title: "aaa", price: 100, description: "3333")
