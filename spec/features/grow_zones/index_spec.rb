require "rails_helper"

RSpec.describe "the GrowZones index page", type: :feature do
  before:each do
    @grow_zone1 = GrowZone.create!(id: 1, name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(id: 2, name: "Chicken Orchard", sq_feet: 750, mulched: false)

  end
  
  # User Story 1, Parent Index 
describe "As a user" do
  describe "When I visit '/grow_zones'" do
    it "shows the name of each grow zone in the system" do
    
      visit "/grow_zones"
      # save_and_open_page  

      expect(page).to have_content(@grow_zone1.name)
      expect(page).to have_content(@grow_zone2.name)

      #need to write "false/lack of content" tests

      end
    end 
  end
end