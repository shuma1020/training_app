class Like < ApplicationRecord
    belongs_to :user
    belongs_to :product

    validate do
        unless user && user.liked_for?(product)
            errors.add(:base, "いいねはできません！")
        end
    end


end
