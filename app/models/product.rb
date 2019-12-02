class Product < ApplicationRecord
    has_many :rewards
    belongs_to :user
    validates :status, presence: true
    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    enum status: {下書き: 0,公開:1}
end
