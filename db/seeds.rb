user1 = User.create!(id: 1, email: "user1@example.com", password: "password", name: "shuma", role: :normal)
user2 = User.create!(id: 2, email: "user2@example.com", password: "password", name: "gggg", role: :staff)
user3 = User.create!(id: 3, email: "user3@example.com", password: "password", name: "user3", role: :normal)

pro1 = user1.products.create!(title: "aaa", price:100, description: "33333", status: :draft, message: "gggg", image: File.open("app/assets/images/image.png"))
pro2 = user2.products.create!(title: "kaka", price:100, description: "eeee", status: :draft,  message: "eeee", image: File.open("app/assets/images/image.png"))
pro3 = user2.products.create!(title: "ronald", price:100, description: "eeee", status: :draft,  message: "eeee", image: File.open("app/assets/images/image.png"))

reward1 = pro1.rewards.create!(title: "aaa", price: 100, description: "3333", product_id:1)
reward2 = pro2.rewards.create!(title: "bbb", price: 100, description: "3333", product_id:2)
reward3 = pro3.rewards.create!(title: "ccc", price: 100, description: "3333", product_id:3)
reward4 = pro3.rewards.create!(title: "ccc", price: 100, description: "3333", product_id:3)


pro4 = user3.products.create!(title: "messi", price:100, description: "eeee", status: :draft,  message: "eeee", image: File.open("app/assets/images/image.png"))
pro5 = user3.products.create!(title: "honda", price:100, description: "eeee", status: :draft,  message: "eeee", image: File.open("app/assets/images/image.png"))

reward5 = pro4.rewards.create!(title: "nono", price: 100, description: "3333", product_id:4)
reward6 = pro5.rewards.create!(title: "nana", price: 100, description: "3333", product_id:5)

