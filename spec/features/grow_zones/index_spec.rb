require "rails_helper"

RSpec.describe "the GrowZones index page", type: :feature do
# User Story 1, Parent Index 
describe "As a user" do
  describe "When I visit '/grow_zones'" do
    it "shows the name of each grow zone in the system" do
      grow_zone_1 = GrowZone.create!(id: 1, 
                                     name: "Little Derby Orchard", 
                                     sq_feet: 340, mulched: true)
      grow_zone_2 = GrowZone.create!(id: 2, 
                                     name: "Chicken Orchard", 
                                     sq_feet: 750, mulched: false)
      
      visit "/grow_zones"
      # save_and_open_page  

      expect(page).to have_content(grow_zone_1.name)
      expect(page).to have_content(grow_zone_2.name)

      end
    end 
  end  
  #   User Story 2, Parent Show 

  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)

  # describe "As a visitor" do
  #   describe "When I visit '/grow_zones/:id'" do
  #     it "Then I see the grow_zone with that dynamic id including the grow_zones attributes" do
  #       grow_zone_1 = GrowZone.create!(id: 1, 
  #                                      name: "Little Derby Orchard", 
  #                                      sq_feet: 340, mulched: true)
  #       grow_zone_2 = GrowZone.create!(id: 2, 
  #                                      name: "Chicken Orchard", 
  #                                      sq_feet: 750, mulched: false)
      
  #     visit "/grow_zones/:id"
  #     expect(page).to have_content()
      end 
    end 
  end 
end