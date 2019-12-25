class AddDonationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :donation, :integer
  end
end
