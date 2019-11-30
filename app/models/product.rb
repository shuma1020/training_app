class Product < ApplicationRecord
    has_many :rewards
    validates :status, presence: true
    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
end
