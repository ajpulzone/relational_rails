require "rails_helper"

RSpec.describe "Updating the attributes of a plant" do

  before:each do
    @grow_zone1 = GrowZone.create!(name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(name: "Chicken Orchard", sq_feet: 750, mulched: false)
    @grow_zone3 = GrowZone.create!(name: "Garden", sq_feet: 460, mulched: true)
    @plant1 = @grow_zone1.plants.create!(name: "Service Berry", edible: true, harvest_qt: 12)
    @plant2 = @grow_zone2.plants.create!(name: "Apple Tree", edible: true, harvest_qt: 30)
    @plant3 = @grow_zone1.plants.create!(name: "Yarrow", edible: false, harvest_qt: 5)
    @plant4 = @grow_zone2.plants.create!(name: "Rhubarb", edible: true, harvest_qt: 60)    
  end

  describe "#update" do  
    it "When a plant show page is visited there is a link 'Update Plant' to update that plant" do

      visit "/plants/#{@plant3.id}"

      expect(page).to have_content(@plant3.name)
      expect(page).to have_no_content(@plant2.name)
      expect(page).to have_link("Update Plant")
      expect(page).to have_no_link("No Plant Here")
    end
     
    it "When the link is clicked, visitor is taken to '/plants/:plant_id/edit' where there is
      a form to edit the plants' attributes" do

      visit "/plants/#{@plant3.id}"

      click_link "Update Plant"
      
      expect(current_path).to eq("/plants/#{@plant3.id}/edit")
      have_selector "form"
    end

    it "When the button is clicked to submit the form 'Update Plant', a 'PATCH' request is sent
      to '/plants/:plant_id', the plants' data is updated and the visitor is redirected to the
      plant show page where they see the plants' updated information" do

      plant5 = @grow_zone2.plants.create!(name: "Plumbb", edible: false, harvest_qt: 60) 

      visit "/plants/#{plant5.id}"

      expect(page).to have_content("Plumbb")
      expect(page).to have_content(false)
      expect(page).to have_content(60)

      visit "/plants/#{plant5.id}/edit"

      expect(page).to have_button("Update Plant")

      fill_in "name", with: "Plum"
      fill_in "edible", with: true
      fill_in "harvest_qt", with: 50
      click_button "Update Plant"
      
      expect(current_path).to eq("/plants/#{plant5.id}")

      expect(page).to have_content("Plum")
      expect(page).to have_content(true)
      expect(page).to have_content(50)

      expect(page).to have_no_content("Plumbb")
      expect(page).to have_no_content(false)
      expect(page).to have_no_content(60)   
      end
    end
  end
