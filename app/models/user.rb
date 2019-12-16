class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  enum role: { normal: 0, staff: 1 }
  has_many :agents
  has_many :items, through: :agents, source: :product

  def patron_for?
    current_user.id == Product.find(params[:id])
  end
end
