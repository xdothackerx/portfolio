require "test_helper"

feature "As the site owner, I want to be able to add portfolio items so I can show off my work." do
  scenario "creating a project" do
    sign_in(:Editor)
    visit projects_path
    click_on "New Project"
    fill_in("Title", :with => projects(:cards).title)
    fill_in("Tech", :with => projects(:cards).tech)
    fill_in("Description", :with => projects(:cards).description)
    click_on "Create Project"
    page.must_have_content "Project was successfully created."
    page.status_code.must_equal 200
  end

  scenario "new project has invalid data" do
    # Given invalid project data is entered in a form
    sign_in(:Editor)
    visit projects_path
    click_on "New Project"
    # When the form is submitted with a short name and missing tech field
    fill_in("Title", :with => "A")
    click_on "Create Project"
    # Then the form should be displayed again with an error message
    page.text.must_include "New Project"
    page.must_have_content "Invalid form submission."
    #page.must_have_content "Title is too short."
    #page.must_have_content "Tech can't be blank."
  end
end
