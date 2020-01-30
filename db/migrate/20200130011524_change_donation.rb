class ChangeDonation < ActiveRecord::Migration[6.0]
  def change
    change_column_null :patrons, :donation, false
  end
end
