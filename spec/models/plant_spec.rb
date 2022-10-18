require "rails_helper"

RSpec.describe Plant, type: :model do
  it {should belong_to :grow_zone}

  before:each do
    @grow_zone1 = GrowZone.create!(name: "Little Derby Orchard", sq_feet: 340, mulched: true)
    @grow_zone2 = GrowZone.create!(name: "Chicken Orchard", sq_feet: 750, mulched: false)
    @grow_zone3 = GrowZone.create!(name: "Garden", sq_feet: 460, mulched: true)
    @plant1 = @grow_zone1.plants.create!(name: "Service Berry", edible: true, harvest_qt: 12)
    @plant2 = @grow_zone2.plants.create!(name: "Apple Tree", edible: true, harvest_qt: 30)
    @plant3 = @grow_zone1.plants.create!(name: "Yarrow", edible: false, harvest_qt: 5)
    @plant4 = @grow_zone2.plants.create!(name: "Rhubarb", edible: true, harvest_qt: 60)    
  end

  # describe "#index" do
  #   it "should sort plants so only those with a value of true
  #     in the edible column should be shown" do

  #     visit "/plants"

  #     expect(page).to have_content(@plant1.name)
  #     expect(page).to have_content(@plant2.name)
  #     expect(page).to have_content(@plant4.name)
  #     expect(page).to have_no_content(@plant3.name)
  #     expect(page).to have_no_content(false)
      
  #   end
  # end
end