require "rails_helper"

RSpec.describe GrowZone, type: :model do
  it {should have_many :plants}

  before:each do
    @grow_zone1 = GrowZone.create!(name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(name: "Chicken Orchard", sq_feet: 750, mulched: false)
    @grow_zone3 = GrowZone.create!(name: "Garden", sq_feet: 460, mulched: true)
    @plant1 = @grow_zone1.plants.create!(name: "Service Berry", edible: true, harvest_qt: 12)
    @plant2 = @grow_zone2.plants.create!(name: "Apple Tree", edible: true, harvest_qt: 30)
    @plant3 = @grow_zone1.plants.create!(name: "Yarrow", edible: false, harvest_qt: 5)
    @plant4 = @grow_zone2.plants.create!(name: "Rhubarb", edible: true, harvest_qt: 60)    
  end

  describe "#plant_count" do
    it "returns the number of plants associated with the specified grow zone" do

      expect(@grow_zone1.plant_count).to eq(2)
      expect(@grow_zone2.plant_count).to eq(2)
      expect(@grow_zone3.plant_count).to_not eq(1)

    end
  end
end