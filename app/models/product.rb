class Product < ApplicationRecord
    has_many :rewards
    belongs_to :user
    validates :status, presence: true
    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    enum status: {draft: 0, release:1}
    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :likeres, through: :likes, source: :user
    has_many :patrons
    has_many :funders, through: :patrons, source: :user
end
