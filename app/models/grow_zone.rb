class GrowZone < ApplicationRecord
  has_many :plants

  def plant_count
    @plant_count = self.plants.count
  end
end