require "rails_helper"

RSpec.describe "the Grow Zone creation" do

  describe "#new" do
    it "When a user visits the Grow_Zone index page they see the link 'New Grow Zone' to create 
      a new grow_zone record" do

      visit "/grow_zones"

      expect(page).to have_link("New Grow Zone")
    end
  
    it "When the New Grow Zone link is clicked, the user is taken to grow_zones/new where
      there is a form to create a new grow_zone record" do

      visit "/grow_zones"

      expect(page).to have_link("New Grow Zone")
    
      click_link "New Grow Zone"
      expect(current_path).to eq("/grow_zones/new")
      have_selector "form"
    end

    it "When the form is filled out with a new grow_zones' attributes and the button
      'Create Grow Zone' is clicked, then a 'POST' request is sent to
      the '/grow_zones' route, a new grow_zone record is created and the user is
      redirected to the Grow Zone index page where the new Grow Zone is displayed" do

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