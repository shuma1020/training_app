class Patron < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :donation, presence: true
end
