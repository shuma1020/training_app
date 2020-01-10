class Patron < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :donation, presence: true
  belongs_to :reward
end
