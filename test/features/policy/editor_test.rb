require "test_helper"

feature "Editor" do
  scenario "editors can publish" do
    sign_in(:Editor)
    visit new_post_path
    page.must_have_field("post_published")
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"
    page.text.must_include "Status: Published"
  end
end
