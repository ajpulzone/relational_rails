require "rails_helper"

describe "layouts/application", type: :view do
  
  #User story 8
  describe "As a visitor" do
    describe "When I visit any page on the site" do
      it "should display a link to '/plants/' on every page" do
        render
        rendered.should have_selector(:css, 'a[href="/plants/"]')
        
        expect(rendered).to have_selector(:css, 'a[href="/plants/"]')
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
      end
    end 
  end 

end