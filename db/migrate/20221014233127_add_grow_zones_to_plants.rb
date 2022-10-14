class AddGrowZonesToPlants < ActiveRecord::Migration[5.2]
  def change
    add_reference :plants, :grow_zone, foreign_key: true
  end
end
