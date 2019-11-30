class Reward < ApplicationRecord
    belongs_to :product
    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
end
