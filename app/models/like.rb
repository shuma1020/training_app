class Like < ApplicationRecord
    belongs_to :user
    belongs_to :product
    
    validate do
        unless user && user.liked_for?(product)
           puts "いいねできません"
        end
    end

    
end
