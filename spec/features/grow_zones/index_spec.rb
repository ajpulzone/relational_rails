require "rails_helper"

RSpec.describe "the GrowZones index page", type: :feature do
  before:each do
    @grow_zone1 = GrowZone.create!(id: 1, name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(id: 2, name: "Chicken Orchard", sq_feet: 750, mulched: false)
    @grow_zone3 = GrowZone.create!(id: 3, name: "Garden", sq_feet: 460, mulched: true)

  end
  
  # User Story 1, Parent Index 
  describe "As a user" do
    describe "When I visit '/grow_zones'" do
      it "shows the name of each grow zone in the system" do
      
        visit "/grow_zones"

        expect(page).to have_content("Little Derby Orchard")
        expect(page).to have_content("Chicken Orchard")
        expect(page).to have_no_content("No Garden Here")
      end
    end
  end

# User Story 6, Parent Index sorted by Most Recently Created 
  describe "As a user" do
    describe "When I visit '/grow_zones'" do
      it "I see that records are ordered by most recently created first
          and next to each of the records I see when it was created" do

        visit "/grow_zones"

      expect(@grow_zone1.name).to appear_before(@grow_zone2.name)
      expect(@grow_zone2.name).to appear_before(@grow_zone3.name)
      expect(@grow_zone3.name).to_not appear_before(@grow_zone1.name)
      expect(@grow_zone2.name).to_not appear_before(@grow_zone1.name)
      end
    end
  end 

end