class CreateRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :rewards do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :product_id

      t.timestamps
    end
  end
end
