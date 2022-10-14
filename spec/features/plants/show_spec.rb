require "rails_helper"

RSpec.describe "The Plants index page", type: :feature do
  before:each do
    @grow_zone1 = GrowZone.create!(id: 1, name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(id: 2, name: "Chicken Orchard", sq_feet: 750, mulched: false)

    @plant1 = Plant.create!(id: 1, grow_zone_id: 1, name: "Service Berry", edible: true, harvest_qt: 12)
    @plant2 = Plant.create!(id: 2, grow_zone_id: 2, name: "Apple Tree", edible: true, harvest_qt: 30)
    @plant3 = Plant.create!(id: 3, grow_zone_id: 1, name: "Yarrow", edible: false, harvest_qt: 5)
    @plant4 = Plant.create!(id: 4, grow_zone_id: 2, name: "Rhubarb", edible: true, harvest_qt: 60)        
  end
  
#User Story 4, Child Show 
  describe "As a user" do
    describe "When I visit '/plants/:id'" do
      it "Then I see the plant with that id including the plants' attributes" do
        
        visit "/plants/#{@plant1.id}"
        # save_and_open_page

      expect(page).to have_content(@plant1.id)
      expect(page).to have_content(@plant1.grow_zone_id)
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant1.edible)
      expect(page).to have_content(@plant1.harvest_qt)
      expect(page).to have_content(@plant1.created_at)
      expect(page).to have_content(@plant1.updated_at)

      #Have content present tests, need to write tests for
      #no content present still
      end 
    end 
  end 
end 