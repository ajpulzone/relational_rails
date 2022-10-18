require "rails_helper"

RSpec.describe "The Plants index page", type: :feature do
  before:each do
    @grow_zone1 = GrowZone.create!(name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(name: "Chicken Orchard", sq_feet: 750, mulched: false)
    @grow_zone3 = GrowZone.create!(name: "Garden", sq_feet: 460, mulched: true)
    @plant1 = @grow_zone1.plants.create!(name: "Service Berry", edible: true, harvest_qt: 12)
    @plant2 = @grow_zone2.plants.create!(name: "Apple Tree", edible: true, harvest_qt: 30)
    @plant3 = @grow_zone1.plants.create!(name: "Yarrow", edible: false, harvest_qt: 5)
    @plant4 = @grow_zone2.plants.create!(name: "Rhubarb", edible: true, harvest_qt: 60)    
  end

  describe "when a user visits '/plants'" do
    it "They see each plant in the system including the plants' attributes" do

      visit "/plants"

      expect(page).to have_content(@plant1.id)
      expect(page).to have_content(@plant1.grow_zone_id)
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant1.edible)
      expect(page).to have_content(@plant1.harvest_qt)
      expect(page).to have_content(@plant1.created_at)
      expect(page).to have_content(@plant1.updated_at)

      expect(page).to have_content(@plant2.id)
      expect(page).to have_content(@plant2.grow_zone_id)
      expect(page).to have_content(@plant2.name)
      expect(page).to have_content(@plant2.edible)
      expect(page).to have_content(@plant2.harvest_qt)
      expect(page).to have_content(@plant2.created_at)
      expect(page).to have_content(@plant2.updated_at)

      expect(page).to have_content(@plant3.name)
      expect(page).to have_content(@plant4.name)

      expect(page).to have_no_content(@grow_zone1.name)
      expect(page).to have_no_content(@grow_zone3.name)
    end

    it "each plant name should be a link that takes the user to the 
      specified plant's show page" do

      visit "/plants"
      click_link "Rhubarb"

      expect(current_path).to eq("/plants/#{@plant4.id}")
      expect(page).to have_content(@plant4.name)
      expect(page).to have_content(@plant4.id)
      expect(page).to have_no_content(@plant1.name)

      visit "/plants"
      click_link "Service Berry"

      expect(current_path).to eq("/plants/#{@plant1.id}")
      expect(page).to have_content(@plant1.name)
      expect(page).to have_content(@plant1.id)
      expect(page).to have_no_content(@plant3.name)
    end
  end
end 