class Product < ApplicationRecord
    has_many :rewards
    belongs_to :user
    validates :status, presence: true
    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
end
