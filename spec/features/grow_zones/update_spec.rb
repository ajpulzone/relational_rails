require "rails_helper"

RSpec.describe "Updating a Grow Zone" do

  before:each do
    @grow_zone1 = GrowZone.create!(name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(name: "Chicken Orchard", sq_feet: 750, mulched: false)
    @grow_zone3 = GrowZone.create!(name: "Garden", sq_feet: 460, mulched: true)
  end
  
  # User Story 12, Parent Update 
  describe "Updating a Grow Zone" do
    it "When a Grow Zones' show page is visited, there is a link labeled 
      'Update Grow Zone' to update the grow zone" do
      
      visit "/grow_zones/#{@grow_zone1.id}"

      expect(page).to have_link("Update Grow Zone")
    end

    it "When I click the link 'Update Grow Zone' then user is redirected to
      '/grow_zones/:id/edit' where there is a form to edit the grow_zones'
      attributes" do
      
      visit "/grow_zones/#{@grow_zone1.id}"

      click_link "Update Grow Zone"
      expect(current_path).to eq("/grow_zones/#{@grow_zone1.id}/edit")   
      have_selector "form"
    end

    it "When the form is filled out with updated information and the submit
      button is clicked, a PATCH request is sent to '/grow_zones/:id, the grow 
      zones' info is updated and user is redirected to the Grow Zones' show
      page where the grow zones' updated info can be seen" do

      grow_zone4 = GrowZone.create!(name: "Bacc Yad", sq_feet: 210, mulched: false)

      visit "/grow_zones/#{grow_zone4.id}/edit"
      
      expect(page).to have_button("Update Grow Zone")

      fill_in "name", with: "Back Yard"
      fill_in "sq_feet", with: 330
      fill_in "mulched", with: true
      click_button "Update Grow Zone"

      #The above fill in updates all user attributes but if you leave a section
      #blank it will change the atrribute value to nil
      #Need to research how to prevent that from happening

      expect(current_path).to eq("/grow_zones/#{grow_zone4.id}")      
      expect(page).to have_content("Back Yard")
      expect(page).to have_content(330)
      expect(page).to have_content(true)

      expect(page).to have_no_content("Bacc Yad")
      expect(page).to have_no_content(210)
      expect(page).to have_no_content(false)
    end    
  end
end