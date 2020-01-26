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

  def self.create_with_donation(product, user, patron_params)
    ActiveRecord::Base.transaction do
      patron = product.patrons.new(patron_params)
      patron.user_id = user.id
      rewards = product.rewards.where("price<?", patron.donation)
      reward = rewards.order(price: :desc).first
      if reward
        patron.reward_id = reward.id
      else
        patron.reward_id == nil
      end
      if patron.save
        notification = patron.notifications.new(user_id: patron.product.user.id)
        notification.save!
        notification = patron.notifications.new(user_id: user.id)
        if notification.save!
          PatronMailer.notification_for_patron(patron).deliver_now
          PatronMailer.notification_for_owner(patron).deliver_now
        end
        patron
      else
        patron
      end
    end
  end
end
