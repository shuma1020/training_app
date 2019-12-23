class Like < ApplicationRecord
    belongs_to :user
    belongs_to :product
    validate :check_liked

    def check_liked
        unless user && user.liked_for?(product)
            errors.add(:base, "いいねはできません！")
        end
    end
end
