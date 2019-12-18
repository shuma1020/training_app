class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  enum role: { normal: 0, staff: 1 }
  has_many :likes, dependent: :destroy
  has_many :liked_products, through: :likes, source: :product
end
