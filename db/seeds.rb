# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create!(id: 1, email: "user1@example.com", password: "password", name: "shuma", role: :normal)
user2 = User.create!(id: 2, email: "user2@example.com", password: "password", name: "gggg", role: :staff)
user3 = User.create!(id: 3, email: "user3@example.com", password: "password", name: "user3", role: :normal)

pro1 = user1.products.create!(title: "aaa", price:100, description: "33333", status: :release, message: "gggg")
pro2 = user2.products.create!(title: "kaka", price:100, description: "eeee", status: :release,  message: "eeee")
pro3 = user2.products.create!(title: "ronald", price:100, description: "eeee", status: :release,  message: "eeee")

reward1 = pro2.rewards.create!(title: "aaa", price: 100, description: "3333")
reward2 = pro3.rewards.create!(title: "bbb", price: 100, description: "3333")
reward3 = pro3.rewards.create!(title: "ccc", price: 100, description: "3333")
reward4 = pro3.rewards.create!(title: "ccc", price: 100, description: "3333")


pro4 = user3.products.create!(title: "messi", price:100, description: "eeee", status: :draft,  message: "eeee")
pro5 = user3.products.create!(title: "honda", price:100, description: "eeee", status: :draft,  message: "eeee")

reward5 = pro4.rewards.create!(title: "nono", price: 100, description: "3333")
reward6 = pro5.rewards.create!(title: "nana", price: 100, description: "3333")

