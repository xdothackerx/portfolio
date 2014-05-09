require "test_helper"

feature "CheckForZurb" do
  scenario "loading page html" do
    # Given a request to load the root path's .html
    visit root_path
    # When a page is loaded
    # Then the page should look formatted
      # check for top-bar in body
    page.must_have_css('nav.top-bar')
  end
end
