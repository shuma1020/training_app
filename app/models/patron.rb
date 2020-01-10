class Patron < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :reward
  validate :donation_border
  def donation_border
    if self.donation == nil
      errors.add(:base, "空欄です")
    elsif self.donation !=0 && self.donation < reward.price
      errors.add(:base, "最低金額を入れてください")
    else
    end
  end
end
