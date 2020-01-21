class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :patron

  def check_notification_user?
    self.user_id == self.patron.product.user_id
  end
end
