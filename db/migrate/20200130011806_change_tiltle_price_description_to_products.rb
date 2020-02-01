class ChangeTiltlePriceDescriptionToProducts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :rewards, :title , false
    change_column_null :rewards, :description, false
    change_column_null :rewards, :price, false
    change_column :rewards, :price, :integer, default:0
  end
end
