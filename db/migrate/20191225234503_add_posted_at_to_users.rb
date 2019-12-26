class AddPostedAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :posted_at, :datetime
  end
end
