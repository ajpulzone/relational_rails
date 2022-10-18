require "rails_helper"

RSpec.describe "welcome" do

  it "has content" do
    
    visit "/"
    expect(page).to have_content("Welcome to Blonde Dog Farm")
    expect(page).to have_link("Plants")
    expect(page).to have_link("Grow Zones")
  end
end