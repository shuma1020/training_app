class Patron < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :donation, presence: true
  validate :donation_error, if: :donation_check
  belongs_to :reward

  private

  def donation_error
    errors.add(:base, "最低金額に達していません")
  end

  def donation_check
    if self.donation != nil
      reward = product.rewards.order(price: :desc).last
      self.donation < reward.price
    end
  end
end
