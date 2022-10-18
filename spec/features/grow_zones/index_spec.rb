require "rails_helper"

RSpec.describe "the GrowZones index page", type: :feature do
  before:each do
    @grow_zone1 = GrowZone.create!(name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(name: "Chicken Orchard", sq_feet: 750, mulched: false)
    @grow_zone3 = GrowZone.create!(name: "Garden", sq_feet: 460, mulched: true)
    @plant1 = @grow_zone1.plants.create!(name: "Service Berry", edible: true, harvest_qt: 12)
    @plant2 = @grow_zone2.plants.create!(name: "Apple Tree", edible: true, harvest_qt: 30)
    @plant3 = @grow_zone1.plants.create!(name: "Yarrow", edible: false, harvest_qt: 5)
    @plant4 = @grow_zone2.plants.create!(name: "Rhubarb", edible: true, harvest_qt: 60)    
  end
  
  describe "#show" do
    it "When a user visits '/grow_zones' it will have a list of each grow zone in the system" do
    
      visit "/grow_zones"

      expect(page).to have_content("Little Derby Orchard")
      expect(page).to have_content("Chicken Orchard")
      expect(page).to have_no_content("No Garden Here")
    end

    it "the records are ordered by most recently created first
      and next to each of the records I see when it was created" do

      visit "/grow_zones"

      expect(@grow_zone1.name).to appear_before(@grow_zone2.name)
      expect(@grow_zone2.name).to appear_before(@grow_zone3.name)
      expect(@grow_zone3.name).to_not appear_before(@grow_zone1.name)
      expect(@grow_zone2.name).to_not appear_before(@grow_zone1.name)
    end
  end 
end