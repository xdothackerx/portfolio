require "test_helper"

feature "CreateAPublicDomain" do
  scenario "making sure app is up and running in production" do
    visit http://www.
    page.must_have_content "portfolio"
    page.wont_have_content "Goobye All!"
  end
end