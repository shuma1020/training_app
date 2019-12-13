class RemovePatronIdFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :patron_id
  end
end
