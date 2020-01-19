class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :patron
  has_one :product, through: :patron
end
