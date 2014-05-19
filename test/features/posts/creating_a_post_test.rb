require "test_helper"

feature "CreatingAPost" do
  scenario "submit form data to create a new post" do
    # Given an authorized user completes a new post form
    sign_in(:Author)
    visit new_post_path
    fill_in "Title", with: "Blah"
    fill_in "Body", with: "Stuff"
    # When I submit the form
    click_on "Create Post"
    # Then the new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include "Stuff"
    page.has_css? "#author"
    page.text.must_include users(:Author).email
  end
end
