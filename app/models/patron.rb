class Patron < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :reward
end
