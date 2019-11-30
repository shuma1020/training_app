class Product < ApplicationRecord
    has_many :rewards
    validates :status, presence: true
end
