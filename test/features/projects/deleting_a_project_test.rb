require "test_helper"

feature "As the site owner, I want to delete a portfolio item so that I can keep the list focused on my best work" do
  scenario "deleting a project" do
    # Given an existing project
    visit projects_path(projects(:portfolio))
    # When the delete button is clicked
    page.must_have_content projects(:portfolio).title
    find("a", :text => "Destroy", :match => :first).click
    # Then the selected post should be removed
    page.text.must_include "Project was successfully destroyed."
  end
end
