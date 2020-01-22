class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :patron

private
  def to_product_owner?
    self.user_id == self.patron.product.user_id
  end
end
