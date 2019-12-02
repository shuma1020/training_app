class AddUserIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :user_id, :integer
    add_column :rewards, :user_id, :integer
  end
end
