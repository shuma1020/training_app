class RemoveBooleanFromPatron < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :patron_id, :boolean
    add_column :products, :patron_id, :integer
  end
end
