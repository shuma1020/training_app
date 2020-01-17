class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :patron
  belongs_to :product
end
