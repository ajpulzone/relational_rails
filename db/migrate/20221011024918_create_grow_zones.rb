class CreateGrowZones < ActiveRecord::Migration[5.2]
  def change
    create_table :grow_zones do |t|
      t.string :name
      t.integer :sq_feet
      t.boolean :mulched
      t.timestamps
    end
  end
end
