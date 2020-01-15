class AddRewardIdToPatrons < ActiveRecord::Migration[6.0]
  def change
    add_column :patrons, :reward_id, :integer
  end
end
