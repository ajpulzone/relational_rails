require "rails_helper"

RSpec.describe "the Grow Zone creation" do

  describe "When I visit the Grow_Zone index page" do
    it "I see a link to create a new grow_zone record, 'New Grow Zone'" do

      visit "/grow_zones"

      expect(page).to have_link("New Grow Zone")
    end
  
    it "When I click the New Grow Zone link I am taken to grow_zones/new where
      I see a form for a new parent record" do
      visit "/grow_zones"

      expect(page).to have_link("New Grow Zone")
    
      click_link "New Grow Zone"
      expect(current_path).to eq("/grow_zones/new")
      have_selector "form"
    end

    it "When I fill out the form with a new grow_zones' attributes and I click
      on the button 'Create Grow Zone', then a 'POST' request is sent to
      the '/grow_zones' route, a new parent record is created and I am
      redirected to the Grow Zone index page where I see the new Grow Zone 
      displayed" do

    #This test is long and does a lot of functionality, is there a way to
    #refactor in smaller pieces? Coded along with Artist/Songs vid 3
      visit "/grow_zones/new"

      fill_in("Name", with: "Front Orchard")
      fill_in("sq_feet", with: 600)
      fill_in("mulched", with: "true")

      expect(page).to have_button("Create Grow Zone")
      expect(page).to have_no_button("No Plants Here")

      click_button("Create Grow Zone")

      expect(current_path).to eq("/grow_zones")
      expect(page).to have_content("Front Orchard")
      expect(page).to have_no_content("No Orchard Here")
    end
  end 
end