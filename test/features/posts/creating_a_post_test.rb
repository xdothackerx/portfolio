require "test_helper"

feature "CreatingAPost" do
  scenario "submit form data to create a new post" do
    # Given an authorized user completes a new post form
    visit new_user_session_path
    sign_in
    puts page.body
    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Title", with: posts(:cr).body
    # When I submit the form
    click_on "Create Post"
    # Then the new post should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include "how I learned to make Rails apps"
    page.has_css? "#author"
    page.text.must_include users(:Beta).email
  end
end
