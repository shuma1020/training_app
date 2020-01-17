class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :patron
end
