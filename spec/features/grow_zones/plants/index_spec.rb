require "rails_helper"

RSpec.describe "Grow zones songs index" do
  before:each do
    @grow_zone1 = GrowZone.create!(id: 1, name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(id: 2, name: "Chicken Orchard", sq_feet: 750, mulched: false)

    @plant1 = Plant.create!(id: 1, grow_zone_id: 1, name: "Service Berry", edible: true, harvest_qt: 12)
    @plant2 = Plant.create!(id: 2, grow_zone_id: 2, name: "Apple Tree", edible: true, harvest_qt: 30)
    @plant3 = Plant.create!(id: 3, grow_zone_id: 1, name: "Yarrow", edible: false, harvest_qt: 5)
    @plant4 = Plant.create!(id: 4, grow_zone_id: 2, name: "Rhubarb", edible: true, harvest_qt: 60)
  end

  # User Story 5, Parent Children Index 
  describe "As a used" do
    describe "When I visit '/grow_zones/:id/plants" do
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

      #need to write "false/lack of content" tests

      end
    end
  end
end