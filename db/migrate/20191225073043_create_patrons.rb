class CreatePatrons < ActiveRecord::Migration[6.0]
  def change
    create_table :patrons do |t|
      t.references :user
      t.references :product
      t.timestamps
    end
  end
end
