require "test_helper"

feature "EditingAPost" do
  scenario "editing an existing post" do
    sign_in(:Author)
    # Given a post already exists
    visit posts_path
    # When "Edit" is clicked and changed data is submitted
    page.find('tr', :text => posts(:author).title).click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"
    # Then the post is updated
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end
