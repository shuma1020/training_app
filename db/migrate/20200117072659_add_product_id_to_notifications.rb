class AddProductIdToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :product_id, :integer
  end
end
