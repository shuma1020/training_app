class ChangeDonationToPatron < ActiveRecord::Migration[6.0]
  def change
    change_column_null :patrons, :donation, null: false
  end
end
