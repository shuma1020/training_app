class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :patron

  def notification_user?(notification)
    self.user_id == self.patron.product.user_id
  end
end
