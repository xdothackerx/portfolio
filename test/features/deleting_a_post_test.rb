require "test_helper"

feature "DeletingAPost" do
  scenario "deleting an existing post" do
    # Given the post author visiting the index page
    post = posts(:cr)
    visit posts_path
    # When "Delete" is clicked
    page.must_have_content "Code Rails"
    page.find('tbody tr:last').click_on "Destroy"
    # Then the post should be removed from the page
    page.wont_have_content "Code Rails"
  end
end
