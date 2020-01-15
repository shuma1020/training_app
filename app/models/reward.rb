class Reward < ApplicationRecord
    belongs_to :product
    validates :title, presence: true
    validates :price, presence: true
    validates :description, presence: true
    has_many :patrons
    validate :check_number_of_rewards

    private
    def check_number_of_rewards
        if product.rewards.count > 2
            errors.add(:base, "設定できるRewardは３つまでです")
        end
    end
end
