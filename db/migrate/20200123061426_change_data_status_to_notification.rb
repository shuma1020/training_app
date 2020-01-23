class ChangeDataStatusToNotification < ActiveRecord::Migration[6.0]
  def change
    change_column :notifications, :status, :integer, default: 0
  end
end
