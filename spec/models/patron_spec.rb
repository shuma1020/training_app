require 'rails_helper'

RSpec.describe Patron, type: :model do
  it "needs more than rewards lowest price" do
    patron = FactoryBot.create(:patron,donation: 200)
    patron.valid?
  end
end