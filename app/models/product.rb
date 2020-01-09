class Product < ApplicationRecord
    has_many :rewards
    accepts_nested_attributes_for :rewards
    belongs_to :user
    validates :status, presence: true
    validates :title, presence: true
    validates :price, presence: true
    validates :image, presence: true
    validates :description, presence: true
    enum status: {draft: 0, release:1}
    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :likeres, through: :likes, source: :user
    has_many :patrons
    has_many :funders, through: :patrons, source: :user
    validate :require_any_rewards, if: :status_released?
    def require_any_rewards
        errors.add(:base, "Rewardを入れてください") if rewards.blank?
    end
    def status_released?
        if self.status == "release"
            true
        end
    end
end
