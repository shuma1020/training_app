class CreateAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :agents do |t|
      t.references :reward, null: false
      t.references :product, null: false
      t.timestamps
    end
  end
end
