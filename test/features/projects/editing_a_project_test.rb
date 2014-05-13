require "test_helper"

feature "As the site owner, I want to edit a portfolio item so that I can update new project details" do
  scenario "editing a project" do
    # Given an existing project
    visit projects_path(projects(:portfolio))
    # When the edit button is clicked and new information is supplied
    find("a", :text => "Edit", match: :first).click
    fill_in("Title", :with => "Cool")
    click_on "Update Project"
    # Then the selected post says something else
    page.text.must_include "Cool"
  end

  scenario "incorrectly editing an existing project" do
    # Given an existing project
    visit projects_path(projects(:portfolio))
    # When I submit invalid changes
    find("a", :text => "Edit", match: :first).click
    fill_in "Title", with: "A"
    click_on "Update Project"
    # Then the changes should not be saved and I should get to try again.
    page.text.must_include "messed up"
    page.text.must_include "Title is too short"
  end
end
