class AddPatronIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :patron_id, :integer
  end
end
