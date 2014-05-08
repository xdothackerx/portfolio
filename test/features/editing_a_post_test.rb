require "test_helper"

feature "EditingAPost" do
  scenario "editing an existing post" do
    # Given a post already exists
      post = posts(:cf)
      visit posts_path
    # When "Edit" is clicked and changed data is submitted
    page.find('tbody tr:last').click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"
    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end
