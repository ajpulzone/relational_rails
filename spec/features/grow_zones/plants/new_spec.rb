require "rails_helper"

RSpec.describe "Creating a New Plant" do

  before:each do
    @grow_zone1 = GrowZone.create!(name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(name: "Chicken Orchard", sq_feet: 750, mulched: false)
    @grow_zone3 = GrowZone.create!(name: "Garden", sq_feet: 460, mulched: true)
    @plant1 = @grow_zone1.plants.create!(name: "Service Berry", edible: true, harvest_qt: 12)
    @plant2 = @grow_zone2.plants.create!(name: "Apple Tree", edible: true, harvest_qt: 30)
    @plant3 = @grow_zone1.plants.create!(name: "Yarrow", edible: false, harvest_qt: 5)
    @plant4 = @grow_zone2.plants.create!(name: "Rhubarb", edible: true, harvest_qt: 60)
  end

  describe "#create" do
    it "When a user visits a grow_zones' plants index page, there is a link to add a new 
      plant to that grow_zone called 'Create Plant'" do

      visit "/grow_zones/#{@grow_zone1.id}/plants"

      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant3.name)
      expect(page).to have_no_content("Pluerry")
      expect(page).to have_no_content(@plant2.name)

      expect(page).to have_link("Create Plant")
      expect(page).to have_no_link("No Plant Here")
    end
    
    it "When the 'Create Plant' link is clicked, the user is taken to the 'grow_zone/
      :grow_zone_id/plants/new' page where there is a form to add a new plant" do

      visit "/grow_zones/#{@grow_zone1.id}/plants"
      
      click_link "Create Plant"
      expect(current_path).to eq("/grow_zones/#{@grow_zone1.id}/plants/new")
      have_selector "form"
    end

    it "When user fills in the form with the plants' attributes, and the button
      'Create Plant' is clicked, then a 'POST' request is sent to 'grow_zones/:grow_zone_id/plants'
      a new plant object/row is created for that grow_zone, and user is redirected to
      the grow_zone plant index page where the new plant is listed" do

      visit "/grow_zones/#{@grow_zone1.id}/plants/new"

      fill_in "name", with: "Pluerry"
      fill_in "edible", with: true
      fill_in "harvest_qt", with: 25

      expect(page).to have_button("Create Plant")
      expect(page).to have_no_button("No Plants Here")

      click_button "Create Plant"

      expect(current_path).to eq("/grow_zones/#{@grow_zone1.id}/plants")
      expect(page).to have_content("Pluerry")
      expect(page).to have_content("true")
      expect(page).to have_content(25)

      expect(page).to have_no_content("Cucumber")
      expect(page).to have_content("false")
      expect(page).to have_content(25)
    end
  end 
end
