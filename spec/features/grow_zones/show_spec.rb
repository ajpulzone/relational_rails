require "rails_helper"

RSpec.describe "the GrowZones show page", type: :feature do
  before:each do
    @grow_zone1 = GrowZone.create!(id: 1, name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(id: 2, name: "Chicken Orchard", sq_feet: 750, mulched: false)
    @grow_zone3 = GrowZone.create!(id: 3, name: "Garden", sq_feet: 460, mulched: true)

    @plant1 = @grow_zone1.plants.create!(id: 1, name: "Service Berry", edible: true, harvest_qt: 12)
    @plant2 = @grow_zone2.plants.create!(id: 2, name: "Apple Tree", edible: true, harvest_qt: 30)
    @plant3 = @grow_zone1.plants.create!(id: 3, name: "Yarrow", edible: false, harvest_qt: 5)
    @plant4 = @grow_zone2.plants.create!(id: 4, name: "Rhubarb", edible: true, harvest_qt: 60)    
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

# User Story 7, Parent Child Count
describe "As a user" do
    describe "When I visit '/grow_zones/:id'" do
      it "Then I see a count of the number of children associated with this parent" do

      visit "/grow_zones/#{@grow_zone1.id}"

      expect(page).to have_content("Number of plants: 2")
      expect(page).to_not have_content("Number of plants: 0")
      #save_and_open_page
      end
    end
  end

  #User story 10
  describe "As a visitor" do
    describe "When I visit a grow_zones show page" do
      it "should display a link to that grow_zones' plants page" do
        
        visit "/grow_zones/#{@grow_zone1.id}"

        expect(page).to have_link("Plant List", href: "/grow_zones/#{@grow_zone1.id}/plants" )
        expect(page).to_not have_link("No Plants Here", href:"/grow_zones/#{@grow_zone1.id}/no_plants")

        click_link "Plant List"
        expect(current_path).to eq("/grow_zones/1/plants")
        #How do I test that this link actually takes me where I ask it to/it is not broken?
      end
    end 
  end 

end