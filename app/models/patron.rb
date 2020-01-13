class Patron < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validate :donation_error, if: :donation_check
  belongs_to :reward

  def donation_error
    errors.add(:base, "最低金額に達していません")
  end

  def donation_check
    self.donation < product.price or self.donation == nil
  end
end
