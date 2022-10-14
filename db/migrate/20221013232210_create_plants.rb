class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.boolean :edible
      t.integer :harvest_qt
      t.timestamps
    end
  end
end
