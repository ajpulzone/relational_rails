require "rails_helper"

RSpec.describe "The Plants index page", type: :feature do
  before:each do
    @grow_zone1 = GrowZone.create!(id: 1, 
                                   name: "Little Derby Orchard", 
                                   sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(id: 2, 
                                   name: "Chicken Orchard", 
                                   sq_feet: 750, mulched: false)
      
    @plant1 = Plant.create!(id: 1, 
                           name: "Service Berry",
                           edible: true,
                           harvest_qt: 12)
    @plant2 = Plant.create!(id: 2,
                           name: "Apple Tree",
                           edible: true,
                           harvest_qt: 30)
          
  end

#User Story 3, Child Index 
  describe "As a user" do
    describe "When I visit '/plants'" do
      it "I see each plant in the system including the plants' attributes" do
        # binding.pry
        visit "/plants"
        # save_and_open_page
     
      expect(page).to have_content(@plant1.id)
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant1.edible)
      expect(page).to have_content(@plant1.harvest_qt)
      expect(page).to have_content(@plant1.created_at)
      expect(page).to have_content(@plant1.updated_at)

      expect(page).to have_content(@plant2.id)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant2.edible)
      expect(page).to have_content(@plant2.harvest_qt)
      expect(page).to have_content(@plant2.created_at)
      expect(page).to have_content(@plant2.updated_at)

      #Have content present tests, need to write tests for
      #no content present still

      end
    end

  end
end 