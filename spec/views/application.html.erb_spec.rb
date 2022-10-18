require "rails_helper"

describe "layouts/application", type: :view do

  describe "global links" do
    it "when a user visits any page on the site it should display a link to 
      '/plants/' on every page" do

      render

      rendered.should have_selector(:css, 'a[href="/plants/"]')
    end

    it "when a user visits any page on the site it should display a link to 
      '/plants/' on every page" do

      render

      rendered.should have_selector(:css, 'a[href="/grow_zones/"]')
    end
  end 
end 
