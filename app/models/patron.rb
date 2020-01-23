class Patron < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :donation, presence: true
  validate :donation_error
  belongs_to :reward
  has_many :notifications
  private

  def donation_error
      reward = product.rewards.order(price: :desc).last
      errors.add(:base, "最低金額に達していません") if self.donation != nil && self.donation < reward.price
  end
end
