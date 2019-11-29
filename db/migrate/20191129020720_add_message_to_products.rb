class AddMessageToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column:products, :message, :text
  end
end
