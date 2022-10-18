require "rails_helper"

RSpec.describe "Grow zones plants index" do

  before:each do
    @grow_zone1 = GrowZone.create!(name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(name: "Chicken Orchard", sq_feet: 750, mulched: false)
    @grow_zone3 = GrowZone.create!(name: "Garden", sq_feet: 460, mulched: true)
    @plant1 = @grow_zone1.plants.create!(name: "Service Berry", edible: true, harvest_qt: 12)
    @plant2 = @grow_zone2.plants.create!(name: "Apple Tree", edible: true, harvest_qt: 30)
    @plant3 = @grow_zone1.plants.create!(name: "Yarrow", edible: false, harvest_qt: 5)
    @plant4 = @grow_zone2.plants.create!(name: "Rhubarb", edible: true, harvest_qt: 60)    
  end

  describe "as a user when I visit '/grow_zones/:id/plants" do
    it "I see each plant that is associated with that grow_zone id and the attributes for each plant" do

      visit "/grow_zones/#{@grow_zone1.id}/plants"

      expect(page).to have_content(@plant1.id)
      expect(page).to have_content(@plant1.grow_zone_id)
      expect(page).to have_content(@plant1.edible)
      expect(page).to have_content(@plant1.harvest_qt)
      expect(page).to have_content(@plant1.created_at)
      expect(page).to have_content(@plant1.updated_at)

      expect(page).to have_content(@plant3.id)
      expect(page).to have_content(@plant3.grow_zone_id)
      expect(page).to have_content(@plant3.edible)
      expect(page).to have_content(@plant3.harvest_qt)
      expect(page).to have_content(@plant3.created_at)
      expect(page).to have_content(@plant3.updated_at)

      expect(page).to have_no_content(@plant2.name)
      expect(page).to have_no_content(@plant4.name)
      expect(page).to have_no_content(@grow_zone2.name)
    end

    it "and the name of each plant is a link to that plant's show page" do

      visit "/grow_zones/#{@grow_zone1.id}/plants"

      expect(page).to have_link("Service Berry")
      click_link "Service Berry"
      expect(current_path).to eq("/plants/#{@plant1.id}")
      expect(page).to have_content("Service Berry")
      expect(page).to have_content(12)
      expect(page).to have_no_content("Apple Tree")

      visit "/grow_zones/#{@grow_zone1.id}/plants"

      expect(page).to have_link("Yarrow")
      click_link "Yarrow"
      expect(current_path).to eq("/plants/#{@plant3.id}")
      expect(page).to have_content("Yarrow")
      expect(page).to have_content(5)
      expect(page).to have_no_content("Service Berry")
    end
  end
end