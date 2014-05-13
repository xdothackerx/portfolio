require "test_helper"

feature "As the site owner, I want to be able to add portfolio items so I can show off my work." do
  scenario "creating a project" do
    visit projects_path
    click_on "New project"
    fill_in("Title", :with => "Cards")
    fill_in("Tech", :with => "Ruby")
    fill_in("Description", :with => "OO modeling practice with a deck of cards.")
    click_on "Create Project"
    page.must_have_content "Project was successfully created."
    page.status_code.must_equal 200
  end
end
