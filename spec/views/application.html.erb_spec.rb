require "rails_helper"

describe "layouts/application", type: :view do
  
  #User story 8
  describe "As a visitor" do
    describe "When I visit any page on the site" do
      it "should display a link to '/plants/' on every page" do
        render
        rendered.should have_selector(:css, 'a[href="/plants/"]')
        expect(rendered).to have_selector(:css, 'a[href="/plants/"]')
        #Are these two tests the same/redundant?

        #Unsure if the below tests are needed/appropriate for this type of spec
        #or if they are phrased correctly as they are not passing atm.
        # click_link "Plants"
        # expect(current_path).to eq("/plants")
        
      end
    end 
  end

  #User story 9
  describe "As a visitor" do
    describe "When I visit any page on the site" do
      it "should display a link to '/grow_zones/' on every page" do
        render
        rendered.should have_selector(:css, 'a[href="/grow_zones/"]')
        expect(rendered).to have_selector(:css, 'a[href="/grow_zones/"]')
        #Are these two tests the same/redundant?

        #Unsure if the below tests are needed/appropriate for this type of spec
        #or if they are phrased correctly as they are not passing atm.
        # click_link "Grow Zones"
        # expect(current_path).to eq("/plants")
      
      end
    end 
  end 

end