class ChangeDefaultToProduct < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :user_id, :integer, default:0
  end
end
