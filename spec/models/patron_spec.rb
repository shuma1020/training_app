require 'rails_helper'

RSpec.describe Patron, type: :model do
  it "needs more than rewards lowest price" do
    product = FactoryBot.create(:product)
    reward = product.rewards.create(title:"ccc",description:"aaaa", price:200)
    patron = reward.patrons.create(donation: 200)
    p patron.valid?
  end
end
