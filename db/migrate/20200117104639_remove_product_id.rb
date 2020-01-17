class RemoveProductId < ActiveRecord::Migration[6.0]
  def change
    remove_column :notifications, :product_id, :integer
  end
end
