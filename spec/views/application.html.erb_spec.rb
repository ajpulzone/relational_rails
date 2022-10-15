require "rails_helper"

describe "layouts/application", type: :view do
  
  it "should display a link to '/plants/' on every page" do
    render
    rendered.should have_selector(:css, 'a[href="/plants/"]')
    
    expect(rendered).to have_selector(:css, 'a[href="/plants/"]')

    # expect(page).to have_link(href="/plants/")
  end
end