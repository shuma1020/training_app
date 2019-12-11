class RemovePatronId < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :patron_id, :integer
    add_column :products, :patron_id, :boolean
  end
end
