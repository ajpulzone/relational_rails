require "rails_helper"

RSpec.describe "the GrowZones show page", type: :feature do
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
    it "When a user visit '/grow_zones/:id', the specified grow_zone is listed along
      with its attributes" do
    
      visit "/grow_zones/#{@grow_zone1.id}"

      expect(page).to have_content(@grow_zone1.id)
      expect(page).to have_content(@grow_zone1.name)
      expect(page).to have_content(@grow_zone1.sq_feet)
      expect(page).to have_content(@grow_zone1.mulched)
      expect(page).to have_content(@grow_zone1.created_at)
      expect(page).to have_content(@grow_zone1.updated_at)

      expect(page).to have_no_content(@grow_zone3.id)
      expect(page).to have_no_content(@grow_zone3.name)
    end 

    it "shows a count of the number of plants associated with this grow_zone" do

      visit "/grow_zones/#{@grow_zone1.id}"

      expect(page).to have_content("Number of plants: 2")
      expect(page).to_not have_content("Number of plants: 0")
    end

    it "there should be a link that will take user to the specified grow_zones' plants page" do
      
      visit "/grow_zones/#{@grow_zone1.id}"

      expect(current_path).to eq("/grow_zones/#{@grow_zone1.id}")
      expect(page).to have_link("Plant List", href: "/grow_zones/#{@grow_zone1.id}/plants")
      expect(page).to_not have_link("No Plants Here", href:"/grow_zones/#{@grow_zone2.id}/no_plants")

      click_link "Plant List"
      expect(current_path).to eq("/grow_zones/#{@grow_zone1.id}/plants")
      expect(page).to have_content("Service Berry")
      expect(page).to have_content("Yarrow")
      expect(page).to have_no_content("Apple Tree")
      expect(page).to have_no_content("Rhubarb")
    end
  end 
end 