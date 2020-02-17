require 'rails_helper'

RSpec.describe Patron, type: :model do
  it "needs more than rewards lowest price" do
    reward = FactoryBot.create(:reward)
    patron = FactoryBot.build(:patron, donation:100)
    patron.valid?

  end
end
