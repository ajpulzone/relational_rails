require "rails_helper"

RSpec.describe "the GrowZones show page", type: :feature do
  before:each do
    @grow_zone1 = GrowZone.create!(id: 1, name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(id: 2, name: "Chicken Orchard", sq_feet: 750, mulched: false)
  end
  
  #User Story 2, Parent Show 
  describe "As a user" do
    describe "When I visit '/grow_zones/:id'" do
      it "Then I see the grow_zone with that id including the grow zones' attributes" do
      
      visit "/grow_zones/#{@grow_zone1.id}"
      #save_and_open_page

      expect(page).to have_content(@grow_zone1.id)
      expect(page).to have_content(@grow_zone1.name)
      expect(page).to have_content(@grow_zone1.sq_feet)
      expect(page).to have_content(@grow_zone1.mulched)
      expect(page).to have_content(@grow_zone1.created_at)
      expect(page).to have_content(@grow_zone1.updated_at)

      #need to write "false/lack of content" tests
      end 
    end 
  end 
end