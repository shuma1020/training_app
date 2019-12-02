class CreateBattles < ActiveRecord::Migration[6.0]
  def change
    create_table :battles do |t|
      t.integer :status,default: 0, null: false, limit: 1
      t.timestamps
    end
  end
end
